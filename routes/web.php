<?php
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/
$app->get('/', function () use ($app) {
    return view('index', ['name' => 'Paul']);
});

$app->post('/account', ['uses' => 'AccountController@createAccount', 'as' => 'create.account']);
$app->get('/account/{id}', ['uses' => 'AccountController@account', 'as' => 'account']);
$app->post('/bank/account/{id}', ['uses' => 'AccountController@createBankAccount', 'as' => 'bank.account']);
$app->post('/bank/account/deposit/{id}', ['uses' => 'AccountController@depositAccount', 'as' => 'deposit.account']);
$app->post('/bank/account/withdrawn/{id}', ['uses' => 'AccountController@withdrawnAccount', 'as' => 'withdrawn.account']);
$app->post('/account/transactions', ['uses' => 'AccountController@transactions', 'as' => 'transactions']);