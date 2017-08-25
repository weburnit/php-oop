<?php
declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class OrbitModel
 * @package App\Models
 */
class OrbitModel extends Model
{
    protected $table = 'orbit';

    public $timestamps = false;

    protected $fillable = ['hazardous', 'orbit_determination_date', 'orbit_id', 'name', 'speed'];

    /**
     * @param array $data
     */
    public function init(array $data)
    {
        $this->setAttribute('hazardous', array_get($data, 'is_potentially_hazardous_asteroid'));
        $this->setAttribute('orbit_id', array_get($data, 'neo_reference_id'));
        $this->setAttribute('name', array_get($data, 'name'));
        $orbitData = array_get($data, 'orbital_data');
        $this->setAttribute('orbit_determination_date', array_get($orbitData, 'orbit_determination_date'));
        $approachData = array_first(array_get($data, 'close_approach_data'));
        $this->setAttribute('speed', $approachData['relative_velocity']['kilometers_per_hour']);
    }

    /**
     * @return boolean
     */
    public function isHazardous(): bool
    {
        return $this->getAttribute('hazardous');
    }

    /**
     * @return string
     */
    public function getOrbitId(): string
    {
        return $this->getAttribute('orbit_id');
    }

    /**
     * @return string
     */
    public function getName(): string
    {
        return $this->getAttribute('name');
    }

    /**
     * @return string
     */
    public function getDate(): string
    {
        return $this->getAttribute('orbit_determination_date');
    }

    /**
     * @return float
     */
    public function getSpeed(): float
    {
        return (float) $this->getAttribute('speed');
    }
}
