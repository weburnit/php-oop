#!/usr/bin/env bash
chown -R www-data storage/
chown -R www-data boostrap/cache
chmod -R 777 storage/logs
bower install --allow-root
npm install
if [ "$APPLICATION_LIVE" = 1 ]; then
  app/console assetic:dump --env=prod
else
  app/console assetic:dump --env=dev
fi
/usr/local/sbin/php-fpm --nodaemonize
