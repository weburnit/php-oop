<?php

namespace Tests\Unit\Core;

use App\Core\AccountInterface;
use App\Core\AccountMachineBuilder;
use App\Core\Bank;
use App\Core\System\Machine\AbstractAccountSM;
use App\Core\Customer\AccountServiceInterface;
use App\Core\CustomerInterface;
use App\Core\System\Transaction\Deposit;
use App\Core\System\Transaction\Withdrawn;
use Psr\Log\LoggerInterface;

/**
 * Class BankTest
 * @package Tests\Unit\Core
 */
class BankTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var Bank
     */
    private $bank;

    /**
     * @var AccountServiceInterface | \PHPUnit_Framework_MockObject_MockObject
     */
    private $accountService;

    /**
     * @var AccountMachineBuilder | \PHPUnit_Framework_MockObject_MockObject
     */
    private $accountBuilder;

    /**
     * @var LoggerInterface | \PHPUnit_Framework_MockObject_MockObject
     */
    private $logger;

    protected function setUp()
    {
        parent::setUp();
        $this->accountService = $this->createMock(AccountServiceInterface::class);
        $this->accountBuilder = $this->createMock(AccountMachineBuilder::class);
        $this->logger = $this->createMock(LoggerInterface::class);
        $this->bank = new Bank($this->accountService, $this->accountBuilder, $this->logger);
    }

    /**
     * @param $deposit
     * @dataProvider getAccounts
     */
    public function test_add_account($deposit)
    {
        $customer = $this->createMock(CustomerInterface::class);
        $account = $this->createMock(AccountInterface::class);

        $this->accountService->expects(static::once())
            ->method('createAccount')
            ->with($customer)->willReturn($account);
        if ($deposit)
            $account->expects(static::once())->method('addBalance')->with($deposit);
        $this->bank->openAccount($customer, $deposit);
    }

    public function test_close_account()
    {
        $account = $this->createMock(CustomerInterface::class);
        $this->accountService->method('closeAccount')->with($account);
        $this->bank->closeAccount($account);
    }

    public function test_deposit()
    {
        $account = $this->createMock(AccountInterface::class);
        $deposit = new Deposit(10, $account);
        $machine = $this->getMockForAbstractClass(AbstractAccountSM::class, [$account]);
        $this->accountBuilder->method('get')->with($deposit)
            ->willReturn($machine);
        $this->logger->expects(static::exactly(2))->method('info')->withAnyParameters();
        $this->bank->deposit($deposit);
    }

    public function test_withdrawn()
    {
        $account = $this->createMock(AccountInterface::class);
        $deposit = new Withdrawn(10, $account);
        $machine = $this->getMockForAbstractClass(AbstractAccountSM::class, [$account]);
        $this->accountBuilder->method('get')->with($deposit)
            ->willReturn($machine);
        $this->logger->expects(static::exactly(2))->method('info')->withAnyParameters();
        $this->bank->withdrawn($deposit);
    }

    public function test_process_transaction_error()
    {
        $account = $this->createMock(AccountInterface::class);
        $account->method('getBalanceState')->willThrowException(new \RuntimeException('Mock Exception'));
        $deposit = new Withdrawn(10, $account);
        $machine = $this->getMockForAbstractClass(AbstractAccountSM::class, [$account]);
        $this->accountBuilder->method('get')->with($deposit)
            ->willReturn($machine);
        $this->logger->expects(static::once())->method('error')->withAnyParameters();
        $this->bank->withdrawn($deposit);
    }

    public function getAccounts()
    {
        return [
            '#1 Zero' => [
                'deposit' => 10
            ],
            '#2 Float' => [
                'deposit' => 0.5
            ],
            '#3 Zero' => [
                'deposit' => 0
            ]
        ];
    }
}