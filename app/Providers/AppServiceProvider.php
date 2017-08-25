<?php

namespace App\Providers;

use App\Client\NasaClient;
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
        $this->app->configure('nasa');
        $config     = config('nasa');
        $stack      = $this->getClientHandler();
        $httpClient = new Client(
            array_merge(['base_uri' => $config['base_uri']], ['handler' => $stack])
        );

        $this->app->singleton(
            NasaClient::class,
            function () use ($httpClient, $config) {
                return new NasaClient($httpClient, $config['api_key']);
            }
        );
    }

    /**
     * @return HandlerStack
     */
    protected function getClientHandler(): HandlerStack
    {
        $stack = new HandlerStack(\GuzzleHttp\choose_handler());
        $stack->push(Middleware::httpErrors(), 'http_errors');
        $stack->push(Middleware::cookies(), 'cookies');
        $stack->push(Middleware::prepareBody(), 'prepare_body');

        return $stack;
    }
}
