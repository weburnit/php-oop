<?php

namespace Tests\Behavior;

use App\Core\AccountInterface;
use App\Model\Account;
use App\Model\Customer;
use App\Models\OrbitModel;
use Tests\TestCase;

/**
 * Class HomeControllerTest
 * @package Tests\Behavior
 */
class HomeControllerTest extends TestCase
{
    /**
     * Test Home return hello world
     */
    public function test_home()
    {
        $response = $this->get('/');
        $response->assertResponseOk();
    }

    public function test_create_account()
    {
        $response = $this->post('/account', ['name' => 'paulaan', 'email' => 'weburnittv@gmail.com']);
        $response->assertResponseStatus(302);
        $this->seeInDatabase('customers', ['name' => 'paulaan', 'email' => 'weburnittv@gmail.com']);
    }

    public function test_add_bank_account()
    {
        $customer = factory(Customer::class)->create();

        $this->post('/bank/account/' . $customer->getKey(), ['tier' => AccountInterface::PLATINUM_TIER, 'deposit' => 20]);
        $this->assertResponseStatus(302);
        $this->seeInDatabase('accounts', ['tier' => AccountInterface::PLATINUM_TIER, 'balance' => 20, 'fk_customer' => $customer->getKey()]);
    }

    public function test_deposit_bank_account()
    {
        $customer = factory(Customer::class)->create();
        $account = factory(Account::class)->create(['fk_customer' => $customer->getKey(), 'tier' => AccountInterface::PLATINUM_TIER]);
        $this->post('/bank/account/deposit/' . $customer->getKey(), ['tier' => AccountInterface::PLATINUM_TIER, 'amount' => 200]);
        $this->assertResponseStatus(302);

        $this->seeInDatabase('accounts', ['tier' => AccountInterface::PLATINUM_TIER, 'balance' => 200, 'id' => $account->getKey()]);
    }

    public function test_withdrawn_bank_account_success()
    {
        $customer = factory(Customer::class)->create();
        $account = factory(Account::class)->create(['fk_customer' => $customer->getKey(), 'tier' => AccountInterface::PLATINUM_TIER, 'balance' => 200]);
        $this->post('/bank/account/withdrawn/' . $customer->getKey(), ['tier' => AccountInterface::PLATINUM_TIER, 'amount' => 150]);
        $this->assertResponseStatus(302);

        $this->seeInDatabase('accounts', ['tier' => AccountInterface::PLATINUM_TIER, 'balance' => 50, 'id' => $account->getKey()]);
    }

    public function test_withdrawn_bank_account_error()
    {
        $customer = factory(Customer::class)->create();
        $account = factory(Account::class)->create(['fk_customer' => $customer->getKey(), 'tier' => AccountInterface::PLATINUM_TIER, 'balance' => 200]);
        $this->post('/bank/account/withdrawn/' . $customer->getKey(), ['tier' => AccountInterface::PLATINUM_TIER, 'amount' => 400]);
        $this->assertResponseStatus(400);

        $this->seeInDatabase('accounts', ['tier' => AccountInterface::PLATINUM_TIER, 'balance' => 200, 'id' => $account->getKey()]);
    }
}