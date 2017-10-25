<?php
declare(strict_types=1);

namespace App\Core;

use App\Core\Customer\AccountServiceInterface;
use App\Core\System\Machine\SMCallbackInterface;
use App\Core\System\Transaction\Deposit;
use App\Core\System\Transaction\TransactionInterface;
use App\Core\System\Transaction\Withdrawn;
use Psr\Log\LoggerInterface;

/**
 * Class Bank
 * @package App\Core
 */
class Bank implements SMCallbackInterface
{
    /**
     * @var AccountServiceInterface
     */
    private $accountService;

    /**
     * @var AccountMachineBuilder
     */
    private $machineFactory;

    /**
     * @var LoggerInterface
     */
    private $logger;

    /**
     * Bank constructor.
     * @param AccountServiceInterface $accountService
     * @param AccountMachineBuilder $machineFactory
     * @param LoggerInterface $logger
     */
    public function __construct(AccountServiceInterface $accountService, AccountMachineBuilder $machineFactory, LoggerInterface $logger)
    {
        $this->accountService = $accountService;
        $this->machineFactory = $machineFactory;
        $this->logger = $logger;
    }

    /**
     * @param CustomerInterface $customer
     * @param string $tier
     * @param float $deposit
     * @return AccountInterface
     */
    public function openAccount(CustomerInterface $customer, float $deposit = 0, string $tier = AccountInterface::BASIC_TIER): AccountInterface
    {
        $account = $this->accountService->createAccount($customer, $tier);
        if ($deposit) {
            $account->addBalance($deposit);
        }

        return $account;
    }

    /**
     * @param CustomerInterface $account
     * @return bool
     */
    public function closeAccount(CustomerInterface $account): bool
    {
        $this->accountService->closeAccount($account);

        return true;
    }

    /**
     * @param Deposit $transaction
     */
    public function deposit(Deposit $transaction)
    {
        $this->processTransaction($transaction);
    }

    /**
     * @param Withdrawn $transaction
     */
    public function withdrawn(Withdrawn $transaction)
    {
        $this->processTransaction($transaction);
    }

    /**
     * {@inheritdoc}
     */
    public function before(TransactionInterface $entity)
    {
        $transaction = 'withdrawn';
        if ($entity instanceof Deposit)
            $transaction = 'deposit';
        $this->logger->info(
            sprintf('Process %s for account %s',
                $transaction,
                $entity->getAccount()->getCustomer()->getName()
            )
        );
    }

    /**
     * {@inheritdoc}
     */
    public function after(TransactionInterface $entity)
    {
        $this->accountService->saveAccount($entity->getAccount());
        $transaction = 'withdrawn';
        if ($entity instanceof Deposit)
            $transaction = 'deposit';
        $this->logger->info(
            sprintf('Sending SMS/EMail for new %s on account %s',
                $transaction,
                $entity->getAccount()->getCustomer()->getName()
            )
        );
    }

    /**
     * {@inheritdoc}
     */
    public function onError(TransactionInterface $entity, \Throwable $exception)
    {
        $this->logger->error(sprintf('Can not process transaction(%d) on account(%s)', $entity->getAmount(), $entity->getAccount()->getCustomer()->getName()));
    }

    /**
     * @param TransactionInterface $transaction
     */
    private function processTransaction(TransactionInterface $transaction)
    {
        $machine = $this->machineFactory->get($transaction);
        $machine->apply($transaction, $this);
    }
}
