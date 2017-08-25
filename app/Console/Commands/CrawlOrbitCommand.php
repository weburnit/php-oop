<?php
declare(strict_types=1);

namespace App\Console\Commands;

use App\Client\NasaClient;
use App\Models\OrbitModel;
use Illuminate\Console\Command;

/**
 * Class CrawlOrbitCommand
 * @package App\Console\Commands
 */
class CrawlOrbitCommand extends Command
{
    /**
     * @var string
     */
    protected $signature = 'orbit:crawl {start} {end}';

    /**
     * 3. Write a command
     * to request the data from the last 3 days from nasa api
     * response contains count of Near-Earth Objects (NEOs)
     * persist the values in your DB
     * Define the model as follows:
     * date
     * reference (neo_reference_id)
     * name
     * speed (kilometers_per_hour)
     * is hazardous (is_potentially_hazardous_asteroid)
     */
    public function handle()
    {
        $start = $this->argument('start');
        $end   = $this->argument('end');

        /**
         * @var $client NasaClient
         */
        $client = app(NasaClient::class);
        $items  = $client->feed(new \DateTime($end), new \DateTime($start));

        foreach ($items as $item) {
            $orbit = new OrbitModel();
            $orbit->init($item);
            $orbit->save();
        }
    }
}
