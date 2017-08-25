<?php

namespace Tests;

use Laravel\Lumen\Testing\DatabaseTransactions;

abstract class TestCase extends \Laravel\Lumen\Testing\TestCase
{
    use DatabaseTransactions;
    /**
     * Creates the application.
     *
     * @return \Laravel\Lumen\Application
     */
    public function createApplication()
    {
        putenv('API_DOMAIN=localhost');
        putenv('APP_URL=localhost');
        date_default_timezone_set('UTC');

        return require __DIR__.'/../bootstrap/app.php';
    }
}
