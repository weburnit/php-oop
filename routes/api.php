<?php

use Dingo\Api\Routing\Router;
use App\Http\Controllers\APIController;

/* @var Router $api */
$api = app(Router::class);
$api->version(
    'v1',
    function (Router $api) {
        $api->get(
            '/',
            [
                'uses' => APIController::class.'@home',
            ]
        );
    }
);