<?php
/**
 * Created by PhpStorm.
 * User: uttien
 * Date: 10/25/17
 * Time: 10:34 PM
 */

namespace Tests\Unit\Core;

use App\Core\AccountInterface;
use App\Core\Customer\Accounts\BasicTierSM;
use App\Core\Customer\Accounts\PremiumTierSM;
use App\Core\AccountMachineBuilder;
use App\Core\System\Transaction\TransactionInterface;

/**
 * Class AccountMachineBuilderTest
 * @package Tests\Unit\Core
 */
class AccountMachineBuilderTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var AccountMachineBuilder
     */
    protected $builder;

    protected function setUp()
    {
        parent::setUp();
        $this->builder = new AccountMachineBuilder();
    }

    /**
     * @param $transaction
     * @param $class
     * @dataProvider getCases
     */
    public function test_build_machine($transaction, $class)
    {
        $machine = $this->builder->get($transaction);
        static::assertInstanceOf($class, $machine);
    }

    public function getCases()
    {
        $basic = $this->createMock(TransactionInterface::class);
        $basicAccount = $this->createMock(AccountInterface::class);
        $basicAccount->method('getTier')->willReturn(AccountInterface::BASIC_TIER);
        $basic->method('getAccount')->willReturn($basicAccount);

        $premium = $this->createMock(TransactionInterface::class);
        $premiumAccount = $this->createMock(AccountInterface::class);
        $premiumAccount->method('getTier')->willReturn(AccountInterface::PLATINUM_TIER);
        $premium->method('getAccount')->willReturn($premiumAccount);
        return [
            '#1 Basic' => [
                'transaction' => $basic,
                'class' => BasicTierSM::class
            ],
            '#2 Platinium' => [
                'transaction' => $premium,
                'class' => PremiumTierSM::class
            ]
        ];
    }
}