<?php
declare(strict_types=1);

namespace App\Core\System\Transaction;

use App\Core\AccountInterface;

/**
 * Interface TransactionInterface
 * @package App\Core\System\Transaction
 */
interface TransactionInterface
{
    /**
     * @return float
     */
    public function getAmount(): float;

    /**
     * @return AccountInterface
     */
    public function getAccount(): AccountInterface;

    /**
     * @return string
     */
    public function getType(): string;
}