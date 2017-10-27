<?php

namespace App\Core\System\Machine;

use App\Core\System\Machine\Model\AbstractStatusHistoryModel;

/**
 * Interface HistoricalEntityInterface
 * @package App\Core\System\Machine
 */
interface HistoricalEntityInterface
{
    /**
     * @param string $transaction
     * @return AbstractStatusHistoryModel
     */
    public function getBalanceState(string $transaction): AbstractStatusHistoryModel;

    /**
     * @return mixed
     */
    public function save();
}