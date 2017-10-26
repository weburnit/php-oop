<?php

namespace Tests\Unit\Services\SM;

use Illuminate\Database\Eloquent\Model;
use App\Core\System\Machine\Model\AbstractStatusHistoryModel;

/**
 * Class BaseModelTest
 * @package Tests\Unit\Services\SM
 */
class BaseModelTest extends \PHPUnit_Framework_TestCase
{
    public function test_base()
    {
        $base = new class('id', 20, 'withdrawn') extends AbstractStatusHistoryModel
        {
            /**
             * @return string
             */
            protected function getTablePrefix(): string
            {
                return 'base';
            }
        };
        static::assertInstanceOf(Model::class, $base, 'Must be Eloquent Model');
        static::assertEquals('base_histories', $base->getTable());
    }
}