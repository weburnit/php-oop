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
        $api->get('/neo/hazardous', APIController::class.'@hazardous');
        $api->get('/neo/fastest', APIController::class.'@hazardous');
        $api->get('/neo/best-month', APIController::class.'@bestMonth');
        $api->get('/neo/best-year', APIController::class.'@bestYear');
    }
);