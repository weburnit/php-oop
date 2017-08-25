<?php

namespace Tests\Behavior;

use App\Models\OrbitModel;
use Tests\TestCase;

/**
 * Class APIControllerTest
 * @package Tests\Behavior
 */
class APIControllerTest extends TestCase
{
    /**
     * Test Home return hello world
     */
    public function test_home()
    {
        $response = $this->get('/');
        $response->assertJson('{"hello":"world"}');
    }

    /**
     * 4. Create a route /neo/hazardous
     * display all DB entries which contain potentially hazardous asteroids
     * format JSON
     */
    public function test_route_listing_all_records()
    {
        /**
         * @var $orbit OrbitModel
         */
        $orbit    = factory(OrbitModel::class)->create(['hazardous' => true]);
        $response = $this->get('/neo/hazardous');

        $response->assertResponseOk();
        static::assertEquals(
            [
                'data' => [
                    [
                        'hazardous'                => $orbit->isHazardous(),
                        'orbit_determination_date' => $orbit->getDate(),
                        'orbit_id'                 => $orbit->getOrbitId(),
                        'name'                     => $orbit->getName(),
                        'speed'                    => $orbit->getSpeed(),
                    ],
                ],
            ],
            json_decode($response->response->getContent(), true)
        );
    }

    /**
     * 5. Create a route /neo/hazardous
     * display all DB entries which contain potentially hazardous asteroids
     * format JSON
     */
    public function test_fastest_endpoint()
    {
        /**
         * @var $orbit OrbitModel
         */
        $orbit = factory(OrbitModel::class)->create(['hazardous' => true]);
        factory(OrbitModel::class)->create(['hazardous' => false]);
        $response = $this->get('/neo/fastest?hazardous=true');

        $response->assertResponseOk();
        static::assertEquals(
            [
                'data' => [
                    [
                        'hazardous'                => $orbit->isHazardous(),
                        'orbit_determination_date' => $orbit->getDate(),
                        'orbit_id'                 => $orbit->getOrbitId(),
                        'name'                     => $orbit->getName(),
                        'speed'                    => $orbit->getSpeed(),
                    ],
                ],
            ],
            json_decode($response->response->getContent(), true)
        );
    }

    /**
     * 7. Create a route /neo/hazardous
     * display all DB entries which contain potentially hazardous asteroids
     * format JSON
     */
    public function test_best_month()
    {
        /**
         * @var $orbit OrbitModel
         */
        factory(OrbitModel::class)->create(['hazardous' => true, 'orbit_determination_date' => '2017-08-08']);
        factory(OrbitModel::class)->create(['hazardous' => true, 'orbit_determination_date' => '2017-07-08']);
        factory(OrbitModel::class)->create(['hazardous' => false, 'orbit_determination_date' => '2017-07-01']);
        $response = $this->get('/neo/best-month?hazardous=true');

        $response->assertResponseOk();
        static::assertEquals(
            [
                'month' => '7',
            ],
            json_decode($response->response->getContent(), true)
        );
    }

    /**
     * 6. Create a route /neo/hazardous
     * display all DB entries which contain potentially hazardous asteroids
     * format JSON
     */
    public function test_best_year()
    {
        /**
         * @var $orbit OrbitModel
         */
        factory(OrbitModel::class)->create(['hazardous' => true, 'orbit_determination_date' => '2016-08-08']);
        factory(OrbitModel::class)->create(['hazardous' => true, 'orbit_determination_date' => '2017-07-08']);
        factory(OrbitModel::class)->create(['hazardous' => false, 'orbit_determination_date' => '2017-07-01']);
        $response = $this->get('/neo/best-year?hazardous=true');

        $response->assertResponseOk();
        static::assertEquals(
            [
                'year' => '2017',
            ],
            json_decode($response->response->getContent(), true)
        );
    }
}