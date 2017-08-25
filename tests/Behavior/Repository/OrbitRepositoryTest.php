<?php

namespace Tests\Behavior\Repository;

use App\Models\OrbitModel;
use App\Repository\OrbitRepository;
use Tests\TestCase;

/**
 * Class OrbitRepositoryTest
 * @package Tests\Behavior\Repository
 * @covers  \App\Models\OrbitModel
 * @covers  \App\Repository\OrbitRepository
 */
class OrbitRepositoryTest extends TestCase
{
    public function test_init_orbit()
    {
        $item  = file_get_contents(__DIR__.DIRECTORY_SEPARATOR.'item.json');
        $orbit = new OrbitModel();
        $orbit->init(json_decode($item, true));
        $orbit->save();
        static::seeInDatabase('orbit', ['orbit_id' => '2242211']);
    }

    public function test_get_hazardous()
    {
        /**
         * @var $repo OrbitRepository
         */
        $repo  = app(OrbitRepository::class);
        $orbit = factory(OrbitModel::class)->create(['hazardous' => true]);
        factory(OrbitModel::class)->create(['hazardous' => false]);

        $result = $repo->getHazardous();
        $item   = array_first($result);
        static::assertEquals($item->getKey(), $orbit->getKey(), 'Must reflect correct one');
    }

    public function test_get_fastest()
    {
        /**
         * @var $repo OrbitRepository
         */
        $repo  = app(OrbitRepository::class);
        $orbit = factory(OrbitModel::class)->create(['hazardous' => true]);
        factory(OrbitModel::class)->create(['hazardous' => false]);

        $result = $repo->getFastest(true);
        $item   = array_first($result);
        static::assertEquals($item->getKey(), $orbit->getKey(), 'Must reflect correct one');
    }
}