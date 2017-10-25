<?php
declare(strict_types=1);

namespace App\Model;

use App\Core\System\Machine\Model\AbstractStatusHistoryModel;

/**
 * Class TransactionRecord
 * @package App\Model
 */
class TransactionRecord extends AbstractStatusHistoryModel
{
    /**
     * @return string
     */
    protected function getTablePrefix(): string
    {
        return 'transactions';
    }
}