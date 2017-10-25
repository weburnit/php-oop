<?php
declare(strict_types=1);

namespace App\Core;

/**
 * Interface CustomerInterface
 * @package App\Core
 */
interface CustomerInterface
{
    /**
     * @return string
     */
    public function getName(): string;

    /**
     * @return string
     */
    public function getEmail(): string;

    /**
     * @return AccountInterface[]
     */
    public function getAccounts();

    /**
     * @return string
     */
    public function getKey();
}