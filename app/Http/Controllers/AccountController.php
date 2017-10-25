<?php
declare(strict_types=1);

namespace App\Http\Controllers;

use App\Core\AccountInterface;
use App\Core\Bank;
use App\Core\Customer\AccountServiceInterface;
use App\Core\System\Machine\Exception\SMUnacceptableStateException;
use App\Core\System\Transaction\Deposit;
use App\Core\System\Transaction\Withdrawn;
use App\Model\TransactionRecord;
use Illuminate\Http\Request;

/**
 * Class AccountController
 * @package App\Http\Controllers
 */
class AccountController extends Controller
{
    /**
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function createAccount(Request $request)
    {
        /**
         * @var $service AccountServiceInterface
         */
        $service = app(AccountServiceInterface::class);
        $this->validate($request,
            AccountInterface::VALIDATES);

        $customer = $service->createCustomer($request->input('name'), $request->input('email'));

        return redirect()->route('account', ['id' => $customer->getKey()]);
    }

    /**
     * @param string $id
     * @return \Illuminate\View\View
     */
    public function account(string $id)
    {
        /**
         * @var $service AccountServiceInterface
         */
        $service = app(AccountServiceInterface::class);
        $customer = $service->getCustomer($id);

        return view('account', ['customer' => $customer]);
    }

    /**
     * @param string $id
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function createBankAccount(string $id, Request $request)
    {
        /**
         * @var $service AccountServiceInterface
         */
        $service = app(AccountServiceInterface::class);
        $customer = $service->getCustomer($id);
        /**
         * @var $bank Bank
         */
        $bank = app(Bank::class);
        $account = $bank->openAccount($customer, (float)$request->input('deposit'), $request->input('tier', AccountInterface::BASIC_TIER));
        $account->save();

        return redirect()->route('account', ['id' => $id]);
    }

    /**
     * @param string $id
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function depositAccount(string $id, Request $request)
    {
        /**
         * @var $service AccountServiceInterface
         */
        $service = app(AccountServiceInterface::class);
        $customer = $service->getCustomer($id);
        /**
         * @var $bank Bank
         */
        $bank = app(Bank::class);

        try {
            $bank->deposit(new Deposit($request->input('amount'), $service->getAccount($customer, $request->input('tier'))));
        } catch (SMUnacceptableStateException $exception) {
            return response($exception->getMessage(), 400);
        }
        return redirect()->route('account', ['id' => $id]);
    }

    /**
     * @param string $id
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function withdrawnAccount(string $id, Request $request)
    {
        /**
         * @var $service AccountServiceInterface
         */
        $service = app(AccountServiceInterface::class);
        $customer = $service->getCustomer($id);
        /**
         * @var $bank Bank
         */
        $bank = app(Bank::class);

        try {
            $bank->withdrawn(new Withdrawn($request->input('amount'), $service->getAccount($customer, $request->input('tier'))));
        } catch (SMUnacceptableStateException $exception) {
            return response($exception->getMessage(), 400);
        }
        return redirect()->route('account', ['id' => $id]);
    }
}