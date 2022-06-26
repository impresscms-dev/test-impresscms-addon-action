#!/usr/bin/env bash

ICMS_PATH="$1"
JSON_STR=$(php -r 'echo json_encode(["type" => "path", "url" => getcwd()]);')

pushd "$ICMS_PATH"
  composer config repositories.local_addon "$JSON_STR"
popd