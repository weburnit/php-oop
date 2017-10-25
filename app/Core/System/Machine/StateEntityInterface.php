<?php
declare(strict_types=1);

namespace App\Core\System\Machine;

use App\Core\System\Machine\Model\AbstractStatusHistoryModel;

/**
 * Interface StateEntity
 * @package App\Core\System\Machine\Services\SM
 */
interface StateEntityInterface
{
    /**
     * @return float
     */
    public function getBalance(): float ;

    /**
     * @param float $state
     * @return mixed
     */
    public function addBalance(float $state);

    /**
     * @param string $transaction
     * @return AbstractStatusHistoryModel
     */
    public function getBalanceState(string $transaction): AbstractStatusHistoryModel;

    /**
     * @return string
     */
    public function getKey();
}
