<?php

namespace Tests\Unit\Clients;

use App\Client\NasaClient;
use Psr\Http\Message\ResponseInterface;


/**
 * Class NasaClientTest
 * @package Tests\Unit
 */
class NasaClientTest extends \PHPUnit_Framework_TestCase
{
    public function test_feed()
    {
        $guzzleClient = $this->createMock(\GuzzleHttp\Client::class);
        $response     = $this->createMock(ResponseInterface::class);
        $response->method('getBody')->willReturn(file_get_contents(__DIR__.DIRECTORY_SEPARATOR.'response.json'));
        $guzzleClient->expects(static::once())->method('request')
            ->with(
                $this->equalTo('get'),
                $this->equalTo(
                    sprintf(
                        '%s?%s',
                        NasaClient::FEED_URI,
                        http_build_query(
                            [
                                'end_date'   => '2017-08-08',
                                'start_date' => '2017-08-20',
                                'detailed'   => 1,
                                'api_key'    => 'api-key',
                            ]
                        )
                    )
                )
            )
            ->willReturn($response);

        $client  = new NasaClient($guzzleClient, 'api-key');
        $results = $client->feed(new \DateTime('2017-08-08'), new \DateTime('2017-08-20'));
        static::assertCount(9, $results, 'Must reflect number of items');
    }
}