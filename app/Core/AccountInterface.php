<?php
declare(strict_types=1);

namespace App\Core;

use App\Core\System\Machine\StateEntityInterface;

/**
 * Interface AccountInterface
 * @package App\Core\Customer\Accounts
 */
interface AccountInterface extends StateEntityInterface
{
    const BASIC_TIER = 'basic';

    const PLATINUM_TIER = 'platinum';

    const VALIDATES = [
        'name' => 'bail|required|string',
        'email' => 'bail|required|email'
    ];

    /**
     * @return CustomerInterface
     */
    public function getCustomer(): CustomerInterface;

    /**
     * @return float
     */
    public function getBalance(): float;

    /**
     * @return string
     */
    public function getTier(): string;
}