<?php
declare(strict_types=1);

namespace App\Core\System\Transaction;

use App\Core\AccountInterface;

/**
 * Class AbstractTransaction
 * @package App\Core\System\Transaction
 */
abstract class AbstractTransaction implements TransactionInterface
{
    /**
     * @var float
     */
    protected $amount;

    /**
     * @var AccountInterface
     */
    protected $account;

    /**
     * AbstractTransaction constructor.
     * @param float $amount
     * @param AccountInterface $account
     */
    public function __construct(float $amount, AccountInterface $account)
    {
        $this->amount = $amount;
        $this->account = $account;
    }

    /**
     * @return AccountInterface
     */
    public function getAccount(): AccountInterface
    {
        return $this->account;
    }
}
