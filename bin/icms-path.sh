#!/usr/bin/env bash

ICMS_TMP_PATH=$RUNNER_TEMP/icmsweb-$GITHUB_SHA-$GITHUB_RUN_ID-$GITHUB_RUN_ATTEMPT

echo "::set-output name=icms_path::$ICMS_TMP_PATH"