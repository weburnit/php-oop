<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $customer = factory(\App\Model\Customer::class)->create();
        $account = factory(\App\Model\Account::class)->create(['fk_customer' => $customer->getKey()]);

        /**
         * @var $bank \App\Core\Bank
         */
        $bank = app(\App\Core\Bank::class);
        $bank->deposit(new \App\Core\System\Transaction\Deposit(100, $account));
        $bank->deposit(new \App\Core\System\Transaction\Deposit(100, $account));
        $bank->withdrawn(new \App\Core\System\Transaction\Withdrawn(10, $account));
        $bank->withdrawn(new \App\Core\System\Transaction\Withdrawn(5, $account));
    }
}
