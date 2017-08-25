<?php
declare(strict_types=1);

namespace App\Http\Controllers;

use App\Repository\OrbitRepository;
use App\Transformer\OrbitModelTransformer;
use Dingo\Api\Http\Request;
use Dingo\Api\Http\Response;

/**
 * Class APIController
 * @package App\Http\Controllers
 */
class APIController extends Controller
{
    /**
     * @return Response
     */
    public function home(): Response
    {
        return $this->response->array(['hello' => 'world']);
    }

    /**
     * @return Response
     */
    public function hazardous()
    {
        /**
         * @var $repository OrbitRepository
         */
        $repository = app(OrbitRepository::class);
        $items      = $repository->getHazardous();

        return $this->response->collection($items, app(OrbitModelTransformer::class));
    }

    /**
     * @param Request $request
     *
     * @return Response
     */
    public function fastest(Request $request)
    {
        $hazardous = (boolean) $request->get('hazardous', false);
        /**
         * @var $repository OrbitRepository
         */
        $repository = app(OrbitRepository::class);
        $items      = $repository->getFastest($hazardous);

        return $this->response->collection($items, app(OrbitModelTransformer::class));
    }

    /**
     * @param Request $request
     *
     * @return mixed
     */
    public function bestYear(Request $request)
    {
        $hazardous = (boolean) $request->get('hazardous', false);
        /**
         * @var $repository OrbitRepository
         */
        $repository = app(OrbitRepository::class);
        $item       = $repository->bestYear($hazardous);

        return $this->response->array(['year' => $item]);
    }

    /**
     * @param Request $request
     *
     * @return mixed
     */
    public function bestMonth(Request $request)
    {
        $hazardous = (boolean) $request->get('hazardous', false);
        /**
         * @var $repository OrbitRepository
         */
        $repository = app(OrbitRepository::class);
        $item       = $repository->bestMonth($hazardous);

        return $this->response->array(['month' => $item]);
    }
}
