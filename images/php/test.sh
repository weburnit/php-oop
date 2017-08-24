#!/usr/bin/env bash

set -e

cd /var/www/html/apiapps
# Only try to run migration at most 10 times
echo '> Run migration...'
php artisan migrate
echo '> Running PHP Code Sniffer...'
PHPCS_FILES=`find . -name "*.php" -not -path "./vendor/*" -not -path "./var/*" -not -path "./lint/*" -not -path "./bin/*" -not -path "./build/*"  -not -path "./database/*" -not -path "./tests/*"  -not -path "./images/*" | tr '\n' ' '`
./vendor/bin/phpcs --standard=./lint/phpcs/ruleset.xml $PHPCS_FILES

echo '> Running PHP Mess Detector...'
PHPMD_FILES=`find . -name "*.php" -not -path "./vendor/*" -not -path "./var/*" -not -path "./lint/*" -not -path "./bin/*" -not -path "./build/*"  -not -path "./database/*" -not -path "./tests/*"  -not -path "./images/*" | tr '\n' ',' | sed 's/,$//'`
./vendor/bin/phpmd $PHPMD_FILES text ./lint/phpmd/ruleset.xml

echo '> Running Tests...'
./vendor/phpunit/phpunit/phpunit --verbose -c phpunit.xml.dist

echo '> Checking code coverage...'
php /usr/local/bin/coverage-checker ./build/coverage/coverage.xml 100

echo '> Checking swagger.json...'
php artisan swagger:generate /tmp/swagger.json localhost
#swagger validate /tmp/swagger.json
