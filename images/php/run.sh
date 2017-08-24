#!/usr/bin/env bash
if [ "$APPLICATION_LIVE" = 1 ]; then
    rm /usr/local/etc/php/conf.d/xdebug.ini
    composer install --no-dev -o --prefer-source
    cp images/php/ext-newrelic.ini /usr/local/etc/php/conf.d/newrelic.ini
    /etc/init.d/newrelic-sysmond start && npm install && npm run production
else
    /usr/sbin/sshd -D & cp images/php/ext-xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
    composer install
    composer dump-autoload
fi

chown -R www-data storage/
chown -R www-data bootstrap/cache
chmod -R 777 storage/logs
/usr/local/sbin/php-fpm --nodaemonize
