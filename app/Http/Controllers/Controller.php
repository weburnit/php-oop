<?php

namespace App\Http\Controllers;

use Laravel\Lumen\Routing\Controller as BaseController;
use Dingo\Api\Exception\ValidationHttpException;
use Dingo\Api\Http\Response;
use Dingo\Api\Routing\Helpers;

class Controller extends BaseController
{
    use Helpers;
}
