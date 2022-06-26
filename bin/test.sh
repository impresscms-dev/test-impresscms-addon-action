#!/usr/bin/env bash

# shellcheck disable=SC2034
URL=http://localhost
DB_TYPE=pdo.mysql
DB_HOST=127.0.0.1
DB_USER=root
DB_PASS=icms
DB_PCONNECT=0
DB_NAME=icms
DB_CHARSET=utf8
DB_COLLATION=utf8_general_ci
DB_PREFIX=icms
DB_PORT="$1"

ADDON_TEST_PATH="$2"

./bin/phpunit --testdox "$ADDON_TEST_PATH"