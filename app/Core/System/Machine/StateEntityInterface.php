<?php
declare(strict_types=1);

namespace App\Core\System\Machine;

/**
 * Interface StateEntity
 * @package App\Core\System\Machine\Services\SM
 */
interface StateEntityInterface
{
    /**
     * @return float
     */
    public function getBalance(): float;

    /**
     * @param float $state
     * @return mixed
     */
    public function addBalance(float $state);

    /**
     * @return string
     */
    public function getKey();
}
