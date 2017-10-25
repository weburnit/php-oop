<?php
declare(strict_types=1);

namespace App\Core;

use App\Core\System\Machine\SMCallbackInterface;
use App\Core\System\Machine\StateEntityInterface;
use App\Core\System\Transaction\TransactionInterface;

/**
 * Interface SMInterface
 * @package App\Core
 */
interface SMInterface
{
    /**
     * @param TransactionInterface $transaction
     * @return mixed
     */
    public function can(TransactionInterface $transaction): bool;

    /**
     * @param TransactionInterface $transaction
     * @param SMCallbackInterface $callback
     * @return mixed
     */
    public function apply(TransactionInterface $transaction, SMCallbackInterface $callback);

    /**
     * @return StateEntityInterface
     */
    public function getEntity(): StateEntityInterface;
}