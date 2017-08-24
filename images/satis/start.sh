#!/usr/bin/env
build /build/satis.json /build/output --skip-errors
php -S localhost:8888 -t /build/output