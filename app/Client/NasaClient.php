<?php
declare(strict_types=1);

namespace App\Client;

use GuzzleHttp\Client;

/**
 * Class NasaClient
 * @package App\Client
 */
class NasaClient
{
    /**
     * @var Client
     */
    protected $httpClient;

    /**
     * @var string
     */
    private $apiKey;

    const FEED_URI = '/neo/rest/v1/feed';

    /**
     * NasaClient constructor.
     *
     * @param Client $httpClient
     * @param string $apiKey
     */
    public function __construct(Client $httpClient, string $apiKey)
    {
        $this->httpClient = $httpClient;
        $this->apiKey     = $apiKey;
    }

    /**
     * @param \DateTime      $end
     * @param \DateTime|null $start
     * @param bool           $detailed
     *
     * @return array
     */
    public function feed(\DateTime $end, \DateTime $start = null, bool $detailed = true)
    {
        $result = $this->send(
            self::FEED_URI,
            ['end_date' => $end->format('Y-m-d'), 'start_date' => $start->format('Y-m-d'), 'detailed' => $detailed]
        );

        $items = [];
        $data  = json_decode((string) $result->getBody(), true);
        foreach (array_get($data, 'near_earth_objects') as $date => $orbits) {
            $items = array_merge($orbits, $items);
        }
        return $items;
    }

    /**
     * @param string $uri
     * @param array  $request
     *
     * @return \Psr\Http\Message\ResponseInterface
     */
    protected function send(string $uri, array $request)
    {
        $request['api_key'] = $this->apiKey;

        $uri = sprintf('%s?%s', $uri, http_build_query($request));

        return $this->httpClient->request('get', $uri);
    }
}
