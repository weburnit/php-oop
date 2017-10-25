<?php
declare(strict_types=1);

namespace App\Core\Customer;

use App\Core\AccountInterface;
use App\Core\CustomerInterface;

/**
 * Interface AccountServiceInterface
 * @package App\Core\Customer
 */
interface AccountServiceInterface
{
    /**
     * @param string $name
     * @param string $email
     * @return mixed
     */
    public function createCustomer(string $name, string $email): CustomerInterface;

    /**
     * @param CustomerInterface $customer
     * @param string $tier
     * @return AccountInterface
     */
    public function createAccount(CustomerInterface $customer, string $tier = AccountInterface::BASIC_TIER): AccountInterface;

    /**
     * @param CustomerInterface $customer
     * @return mixed
     */
    public function closeAccount(CustomerInterface $customer);

    /**
     * @param string $key
     * @return CustomerInterface
     */
    public function getCustomer(string $key): CustomerInterface;

    /**
     * @param CustomerInterface $customer
     * @param string $account
     * @return AccountInterface
     */
    public function getAccount(CustomerInterface $customer, string $account = AccountInterface::BASIC_TIER): AccountInterface;

    /**
     * @param AccountInterface $account
     * @return mixed
     */
    public function saveAccount(AccountInterface $account);
}
