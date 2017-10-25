<?php
declare(strict_types=1);

namespace App\Repository;

use App\Core\AccountInterface;
use App\Core\Customer\AccountServiceInterface;
use App\Core\CustomerInterface;
use App\Model\Customer;
use App\Model\Account;

/**
 * Class AccountRepository
 * @package App\Repository
 */
class AccountRepository implements AccountServiceInterface
{
    /**
     * {@inheritdoc}
     */
    public function createCustomer(string $name, string $email): CustomerInterface
    {
        $customer = Customer::init($name, $email);
        $customer->save();
        return $customer;
    }

    /**
     * {@inheritdoc}
     */
    public function createAccount(CustomerInterface $customer, string $tier = AccountInterface::BASIC_TIER): AccountInterface
    {
        $account = Account::init($customer->getKey(), $tier);
        $account->save();

        return $account;
    }

    /**
     * {@inheritdoc}
     */
    public function closeAccount(CustomerInterface $account)
    {
        $customer = Customer::find($account->getKey())->firstOrFail();
        $customer->delete();
    }

    /**
     * {@inheritdoc}
     */
    public function getAccount(CustomerInterface $customer, string $tier = AccountInterface::BASIC_TIER): AccountInterface
    {
        return Account::where(['fk_customer' => $customer->getKey(), 'tier' => $tier])->firstOrFail();
    }

    /**
     * {@inheritdoc}
     */
    public function getCustomer(string $key): CustomerInterface
    {
        return Customer::where('id', $key)->orWhere('email', $key)->firstOrFail();
    }

    /**
     * {@inheritdoc}
     */
    public function saveAccount(AccountInterface $account)
    {
        $account->save();

        return $account;
    }
}