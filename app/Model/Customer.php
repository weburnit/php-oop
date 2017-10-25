<?php
declare(strict_types=1);

namespace App\Model;

use App\Core\AccountInterface;
use App\Core\CustomerInterface;
use App\Model\Account;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Customer
 * @package App\Core\Customer
 */
class Customer extends Model implements CustomerInterface
{
    protected $table = 'customers';

    protected $fillable =
        [
            'name',
            'email',
            'fk_customer'
        ];

    /**
     * Customer constructor.
     * @param string $name
     * @param string $email
     * @return static
     */
    public static function init(string $name, string $email)
    {
        $instance = new static(['name' => $name, 'email' => $email]);

        return $instance;
    }


    /**
     * @return string
     */
    public function getName(): string
    {
        return $this->getAttribute('name');
    }

    /**
     * @return string
     */
    public function getEmail(): string
    {
        return $this->getAttribute('email');
    }

    /**
     * @return AccountInterface[]
     */
    public function getAccounts()
    {
        return $this->hasMany(Account::class, 'fk_customer')->getResults();
    }

    /**
     * @return mixed
     */
    public function getTransactions()
    {
        $accounts = $this->getAccounts();
        $accountIds = [];
        foreach ($accounts as $account) {
            $accountIds[] = $account->getKey();
        }

        $transactions = TransactionRecord::whereIn('fk_account', $accountIds)->get();

        return $transactions;
    }
}