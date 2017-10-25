<?php
declare(strict_types=1);

namespace App\Core;

use App\Core\AccountInterface;
use App\Core\Customer\Accounts\BasicTierSM;
use App\Core\Customer\Accounts\PremiumTierSM;
use App\Core\SMInterface;
use App\Core\System\Machine\Exception\SMException;
use App\Core\System\Transaction\TransactionInterface;

/**
 * Class SMFactory
 * @package App\Core\System\Machine\Services\SM
 */
class AccountMachineBuilder
{
    /**
     * @param TransactionInterface $transaction
     * @return SMInterface
     * @throws SMException
     */
    public function get(TransactionInterface $transaction): SMInterface
    {
        switch ($transaction->getAccount()->getTier()) {
            case AccountInterface::BASIC_TIER:
                return new BasicTierSM($transaction->getAccount());
            case AccountInterface::PLATINUM_TIER:
                return new PremiumTierSM($transaction->getAccount());
        }
        throw new SMException(sprintf('State Machine not found for %s', get_class($transaction->getAccount())));
    }
}
