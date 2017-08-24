<?php
$queues = ['evently.attendee_event', 'evently.export_job'];

$file = fopen(__DIR__.DIRECTORY_SEPARATOR.'template/consumer.ini', 'r');

$configFile = fopen(__DIR__.DIRECTORY_SEPARATOR.'consumers.ini', 'w');

foreach ($queues as $event) {
    $file = fopen(__DIR__.DIRECTORY_SEPARATOR.'template/consumer.ini', 'r');
    while ($file && !feof($file)) {
        $line = fgets($file);

        preg_match_all('#\%([a-zA-Z0-9_]+)\%#imsU', $line, $matchAll);

        if (count($matchAll)) {
            $line = str_replace('%event%', $event, $line);
        }
        fwrite($configFile, $line);
    }
    fwrite($configFile, "\n");
    fclose($file);
}
fclose($configFile);
