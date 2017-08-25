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
    \App\Models\OrbitModel::class,
    function (Faker\Generator $faker) {
        return
            [
                'hazardous'                => true,
                'orbit_determination_date' => $faker->date('Y-m-d'),
                'orbit_id'                 => $faker->uuid,
                'name'                     => $faker->name,
                'speed'                    => $faker->numberBetween(10000, 900000),
            ];
    }
);
