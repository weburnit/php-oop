<?php

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| Here you may define all of your model factories. Model factories give
| you a convenient way to create models for testing and seeding your
| database. Just tell the factory how a default model should look.
|
*/

$factory->define(
    \App\Model\Customer::class,
    function (Faker\Generator $faker) {
        return
            [
                'name' => $faker->name,
                'email' => $faker->email,
            ];
    }
);

$factory->define(
    \App\Model\Account::class,
    function (Faker\Generator $faker) {
        return
            [
                'balance' => 0,
                'tier' => \App\Core\AccountInterface::BASIC_TIER,
            ];
    }
);
