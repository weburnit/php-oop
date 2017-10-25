<?php
declare(strict_types=1);

namespace App\Core\System\Transaction;

/**
 * Class Withdrawn
 * @package App\Core\System\Transaction
 */
class Withdrawn extends AbstractTransaction
{
    /**
     * @return float
     */
    public function getAmount(): float
    {
        return -$this->amount;
    }

    /**
     * @return string
     */
    public function getType(): string
    {
        return 'withdrawn';
    }
}