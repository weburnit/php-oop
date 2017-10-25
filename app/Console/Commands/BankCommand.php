<?php
declare(strict_types=1);

namespace App\Console\Commands;

use App\Core\AccountInterface;
use App\Core\Bank;
use App\Core\Customer\AccountServiceInterface;
use App\Core\System\Transaction\Deposit;
use App\Core\System\Transaction\Withdrawn;
use Illuminate\Console\Command;

/**
 * Class BankCommand
 * @package App\Console\Commands
 */
class BankCommand extends Command
{
    /**
     * @var Bank
     */
    private $bank;

    private $customer;

    private $account;
    /**
     * @var string
     */
    protected $signature = 'bank:process';

    /**
     * 3. Write a command
     * to request the data from the last 3 days from nasa api
     * response contains count of Near-Earth Objects (NEOs)
     * persist the values in your DB
     * Define the model as follows:
     * date
     * reference (neo_reference_id)
     * name
     * speed (kilometers_per_hour)
     * is hazardous (is_potentially_hazardous_asteroid)
     */
    public function handle()
    {
        $name = $this->ask('Enter your name to open your new bank account!');
        $email = $this->ask('Enter your Email!');

        $tiers = [AccountInterface::BASIC_TIER, AccountInterface::PLATINUM_TIER];
        $account = $this->anticipate('Select your account: ' . implode($tiers, '/'), $tiers, AccountInterface::BASIC_TIER);

        /**
         * @var $bank Bank
         */
        $this->bank = app(Bank::class);
        /**
         * @var $service AccountServiceInterface
         */
        $service = app(AccountServiceInterface::class);

        $this->customer = $service->createCustomer($name, $email);

        $deposit = $this->ask('Deposit your first money');
        $this->account = $this->bank->openAccount($this->customer, (float)$deposit, $account);

        $bank->deposit(new Deposit((float)$deposit, $this->account));

        try {
            $this->process();
            $this->info(sprintf('Your Current Account has %d', $this->account->getBalance()));
        } catch (\Exception $exception) {
            $this->output->error($exception);
            $this->info('Try Again!');
            $this->process();
        }
    }

    private function deposit()
    {
        $amount = $this->ask('How much?');

        $this->bank->deposit(new Deposit((float)$amount, $this->account));
    }

    private function withdrawn()
    {
        $amount = $this->ask('How much?');

        $this->bank->withdrawn(new Withdrawn((float)$amount, $this->account));
    }

    private function process()
    {
        $actions = ['withdrawn', 'deposit'];
        $action = $this->anticipate('What do you wanna do?' . implode($actions, '/'), $actions, 'withdrawn');

        switch ($action) {
            case 'withdrawn':
                $this->withdrawn();
                break;
            case 'deposit':
                $this->deposit();
                break;
        }
    }
}
