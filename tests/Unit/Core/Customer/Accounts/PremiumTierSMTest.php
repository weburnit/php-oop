<?php
/**
 * Created by PhpStorm.
 * User: uttien
 * Date: 10/25/17
 * Time: 9:39 PM
 */

namespace Tests\Unit\Core\Customer\Accounts;

use App\Core\AccountInterface;
use App\Core\Customer\Accounts\PremiumTierSM;
use App\Core\System\Machine\Model\AbstractStatusHistoryModel;
use App\Core\System\Machine\SMCallbackInterface;
use App\Core\System\Transaction\TransactionInterface;

/**
 * Class PremiumTierSMTest
 * @package Tests\Unit\Core\Customer\Accounts
 */
class PremiumTierSMTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var \PHPUnit_Framework_MockObject_MockObject | SMCallbackInterface
     */
    protected $callback;

    protected function setUp()
    {
        parent::setUp();
        $this->callback = $this->createMock(SMCallbackInterface::class);
    }

    /**
     * @dataProvider getSuccessCases
     * @param TransactionInterface $transaction
     * @param \PHPUnit_Framework_MockObject_MockObject $account
     */
    public function test_apply_success(TransactionInterface $transaction, $account)
    {
        $machine = new PremiumTierSM($account);
        $history = $this->createMock(AbstractStatusHistoryModel::class);
        $history->expects(static::once())->method('save');
        $account->method('getBalanceState')->willReturn($history);
        $account->expects(static::once())->method('addBalance')->with($transaction->getAmount());
        $this->callback->expects(static::once())->method('before')->with($transaction);
        $this->callback->expects(static::once())->method('after')->with($transaction);
        $machine->apply($transaction, $this->callback);
    }

    /**
     * @dataProvider getFailureCases
     * @expectedException \App\Core\System\Machine\Exception\SMUnacceptableStateException
     * @param TransactionInterface $transaction
     * @param $account
     */
    public function test_apply_error(TransactionInterface $transaction, $account)
    {
        $machine = new PremiumTierSM($account);
        $account->expects(static::once())->method('addBalance')->with($transaction->getAmount());
        $this->callback->expects(static::never())->method('before')->with($transaction);
        $machine->apply($transaction, $this->callback);
    }

    public function getSuccessCases()
    {
        $properTransaction = $this->createMock(TransactionInterface::class);
        $properTransaction->method('getAmount')->willReturn(50);
        $properAccount = $this->createMock(AccountInterface::class);
        $properAccount->method('getBalance')->willReturn(100);

        $zeroAccount = $this->createMock(AccountInterface::class);
        $zeroAccount->method('getBalance')->willReturn(50);
        $properExceedAccount = $this->createMock(AccountInterface::class);
        $properExceedAccount->method('getBalance')->willReturn(20);
        return [
            '#1 Proper balance' => [
                'transaction' => $properTransaction,
                'account' => $properAccount
            ],
            '#2 Zero Balance' => [
                'transaction' => $properTransaction,
                'account' => $zeroAccount
            ],
            '#3 Proper exceed' => [
                'transaction' => $properTransaction,
                'account' => $properExceedAccount
            ]
        ];
    }

    public function getFailureCases()
    {
        /**
         * Withdrawn Transaction
         */
        $properTransaction = $this->createMock(TransactionInterface::class);
        $properTransaction->method('getAmount')->willReturn(-50);

        $lowerAccount = $this->createMock(AccountInterface::class);
        $lowerAccount->method('getBalance')->willReturn(10);

        $blankAccount = $this->createMock(AccountInterface::class);
        $blankAccount->method('getBalance')->willReturn(0);
        return [
            '#1 Proper balance' => [
                'transaction' => $properTransaction,
                'account' => $lowerAccount
            ],
            '#2 Zero Balance' => [
                'transaction' => $properTransaction,
                'account' => $blankAccount
            ]
        ];
    }
}