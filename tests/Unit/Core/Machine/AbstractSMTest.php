<?php
/**
 * Created by PhpStorm.
 * User: uttien
 * Date: 10/25/17
 * Time: 10:28 PM
 */

namespace Tests\Unit\Core\Machine;


use App\Core\AccountInterface;
use App\Core\System\Machine\AbstractAccountSM;
use App\Core\System\Machine\SMCallbackInterface;
use App\Core\System\Transaction\TransactionInterface;

class AbstractSMTest extends \PHPUnit_Framework_TestCase
{
    public function test_error_base()
    {
        $account = $this->createMock(AccountInterface::class);
        $machine = new class($account) extends AbstractAccountSM
        {
            /**
             * @param TransactionInterface $transaction
             * @return mixed
             */
            public function can(TransactionInterface $transaction): bool
            {
                return true;
            }
        };

        $transaction = $this->createMock(TransactionInterface::class);
        $callBackCauseError = $this->createMock(SMCallbackInterface::class);
        $exception = new \RuntimeException('Mock Exception');
        $callBackCauseError->expects(static::once())->method('before')
            ->willThrowException($exception);
        $callBackCauseError->expects(static::once())->method('onError')->with($transaction, $exception);
        $machine->apply($transaction, $callBackCauseError);
    }
}