<?php
declare(strict_types=1);

namespace App\Model;

use App\Core\AccountInterface;
use App\Core\CustomerInterface;
use App\Core\System\Machine\Model\AbstractStatusHistoryModel;
use App\Model\Customer;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Account
 * @package App\Model
 */
class Account extends Model implements AccountInterface
{
    protected $table = 'accounts';

    protected $fillable =
        [
            'balance',
            'tier',
            'fk_customer'
        ];

    /**
     * @param string $fkCustomer
     * @param string $tier
     * @return static
     */
    public static function init($fkCustomer, string $tier)
    {
        $instance = new static(['fk_customer' => $fkCustomer, 'tier' => $tier, 'balance' => 0]);

        return $instance;
    }
    /**
     * @return CustomerInterface
     */
    public function getCustomer(): CustomerInterface
    {
        return $this->belongsTo(Customer::class, 'fk_customer')->getResults();
    }

    /**
     * @return float
     */
    public function getBalance(): float
    {
        return (float) $this->getAttribute('balance');
    }

    /**
     * @return string
     */
    public function getTier(): string
    {
        return $this->getAttribute('tier');
    }

    /**
     * @param float $amount
     * @return mixed
     */
    public function addBalance(float $amount)
    {
        $this->setAttribute('balance', $this->getBalance() + $amount);
    }

    /**
     * @param string $transaction
     * @return AbstractStatusHistoryModel
     */
    public function getBalanceState(string $transaction): AbstractStatusHistoryModel
    {
        return new TransactionRecord($this->getKey(), $this->getBalance(), $transaction);
    }
}