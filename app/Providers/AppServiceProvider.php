<?php

namespace App\Providers;

use App\Client\NasaClient;
use App\Core\Customer\AccountServiceInterface;
use App\Repository\AccountRepository;
use GuzzleHttp\Client;
use GuzzleHttp\HandlerStack;
use GuzzleHttp\Middleware;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton(AccountServiceInterface::class, AccountRepository::class);
    }
}
