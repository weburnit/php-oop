<?php
declare(strict_types=1);

namespace App\Core\System\Machine\Model;

use Illuminate\Database\Eloquent\Model;

/**
 * Class AbstractStatusHistoryModel
 * @package App\Core\System\Machine\Model
 */
abstract class AbstractStatusHistoryModel extends Model
{
    protected $table = 'histories';
    const UPDATED_AT = null;

    protected $fillable = [
        'fk_account',
        'balance',
        'type'
    ];

    /**
     * AbstractStatusHistoryModel constructor.
     *
     * @param mixed $entityId
     * @param float $balance
     * @param string $type
     */
    public function __construct($entityId = null, float $balance = null, string $type = null)
    {
        parent::__construct(['fk_account' => $entityId, 'balance' => $balance, 'type' => $type]);
    }

    /**
     * @return string
     */
    public function getTable()
    {
        $table = parent::getTable();

        return sprintf('%s_%s', $this->getTablePrefix(), $table);
    }

    /**
     * @return string
     */
    abstract protected function getTablePrefix(): string;

    public function getType()
    {
        return $this->getAttribute('type');
    }

    public function getBalance()
    {
        return $this->getAttribute('balance');
    }
}
