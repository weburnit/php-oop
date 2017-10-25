<?php
declare(strict_types=1);

namespace App\Core\Customer\Accounts;

use App\Core\System\Machine\Exception\SMUnacceptableStateException;
use App\Core\System\Transaction\TransactionInterface;

/**
 * Class PremiumTierSM
 * @package App\Core\Customer\Accounts
 */
class PremiumTierSM extends AbstractAccountSM
{
    const WITHDRAWN_EXCEED = 30;

    /**
     * @param TransactionInterface $transaction
     * @return bool
     * @throws SMUnacceptableStateException
     */
    public function can(TransactionInterface $transaction): bool
    {
        $account = $this->getEntity();
        if ($account->getBalance() + self::WITHDRAWN_EXCEED + $transaction->getAmount() >= 0) {
            return true;
        }
        throw new SMUnacceptableStateException(
            sprintf(
                'This Account%s(%s) is unable to process this transaction(%d)',
                get_class($this->getEntity()),
                $this->getEntity()->getKey(),
                $transaction->getAmount()
            )
        );
    }

}