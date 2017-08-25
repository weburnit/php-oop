<?php

return [
    /*
        |--------------------------------------------------------------------------
        | Default Queue Driver
        |--------------------------------------------------------------------------
        |
        | The Laravel queue API supports a variety of back-ends via an unified
        | API, giving you convenient access to each back-end using the same
        | syntax for each one. Here you may set the default queue driver.
        |
        | Supported: "null", "sync", "database", "beanstalkd", "sqs", "redis"
        |
        */

    'default' => env('QUEUE_DRIVER', 'sync'),

    /*
    |--------------------------------------------------------------------------
    | Queue Connections
    |--------------------------------------------------------------------------
    |
    | Here you may configure the connection information for each server that
    | is used by your application. A default configuration has been added
    | for each back-end shipped with Laravel. You are free to add more.
    |
    */

    'connections'    => [
        'sync'  => [
            'driver' => 'sync',
        ],
        'redis' => [
            'driver'     => env('QUEUE_DRIVER', 'redis'),
            'connection' => env('QUEUE_CONNECTION', 'default'),
            'queue'      => env('QUEUE_DEFAULT', 'default'),
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Delay Configuration for attempts on queues, unit is second
    |
    | array(
    |     1  => 10,
    |     2  => 20,
    | ),
    |
    | Delay the job 10 seconds after first time it's processed failed.
    | Delay the job 20 seconds after second time it's processed failed.
    | Total processing time is 3.
    |
    |--------------------------------------------------------------------------
    */
    'attempt_delays' => [
        'shipper_not_found' => 60,
        'job_max_retries'   => env('LGMS_JOB_MAX_RETRIES', 60),
        'connect_exception' => 5,
    ],

    /*
    |--------------------------------------------------------------------------
    | Failed Queue Jobs
    |--------------------------------------------------------------------------
    |
    | These options configure the behavior of failed queue job logging so you
    | can control which database and table are used to store the jobs that
    | have failed. You may change them to any database / table you wish.
    |
    */

    //    'failed' => [
    //        'database' => env('DB_CONNECTION', 'default'),
    //        'table'    => 'failed_jobs',
    //    ],
];
