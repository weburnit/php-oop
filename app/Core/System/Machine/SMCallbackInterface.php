<?php
declare(strict_types=1);

namespace App\Core\System\Machine;

use App\Core\System\Transaction\TransactionInterface;

/**
 * Interface SMCallbackInterface
 * @package App\Core\System\Machine\Services\SM
 */
interface SMCallbackInterface
{
    /**
     * @param TransactionInterface $entity
     *
     * @return mixed
     */
    public function before(TransactionInterface $entity);

    /**
     * @param TransactionInterface $entity
     *
     * @return mixed
     */
    public function after(TransactionInterface $entity);

    /**
     * @param TransactionInterface $entity
     * @param \Throwable $exception
     */
    public function onError(TransactionInterface $entity, \Throwable $exception);
}
