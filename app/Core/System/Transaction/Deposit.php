<?php
declare(strict_types=1);

namespace App\Core\System\Transaction;

/**
 * Class Deposit
 * @package App\Core\System\Transaction
 */
class Deposit extends AbstractTransaction
{
    /**
     * @return float
     */
    public function getAmount(): float
    {
        return $this->amount;
    }

    /**
     * @return string
     */
    public function getType(): string
    {
        return 'deposit';
    }
}