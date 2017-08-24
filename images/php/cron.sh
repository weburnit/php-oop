#!/usr/bin/env bash
if [ "$APPLICATION_LIVE" = 1 ]; then
    composer install --no-dev
    composer dump-autoload --optimize
    cp images/php/ext-newrelic.ini /usr/local/etc/php/conf.d/newrelic.ini
    rm /usr/local/etc/php/conf.d/xdebug.ini
fi
chown -R www-data storage/
chown -R www-data bootstrap/cache
chmod -R 777 storage/logs
set -e
supervisord -c /etc/supervisor/conf.d/supervisord.conf
