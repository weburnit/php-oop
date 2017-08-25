<?php
declare(strict_types=1);

namespace App\Transformer;

use App\Models\OrbitModel;
use League\Fractal\TransformerAbstract;

/**
 * Class OrbitModelTransformer
 * @package App\Transformer
 */
class OrbitModelTransformer extends TransformerAbstract
{
    /**
     * @param OrbitModel $orbit
     *
     * @return array
     */
    public function transform(OrbitModel $orbit): array
    {
        return [
            'hazardous'                => $orbit->isHazardous(),
            'orbit_determination_date' => $orbit->getDate(),
            'orbit_id'                 => $orbit->getOrbitId(),
            'name'                     => $orbit->getName(),
            'speed'                    => $orbit->getSpeed(),
        ];
    }
}
