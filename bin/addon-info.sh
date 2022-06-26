#!/usr/bin/env bash

ADDON_TYPE="$1"

if [ -f "composer.json" ]; then
  echo "::set-output name=addon_name::$(composer config name)"
  echo "::set-output name=addon_installation_type::composer"
  DETECTED_TYPE=$(composer config type)
else
  DETECTED_TYPE="impresscms-module"
  echo "::set-output name=addon_installation_type::legacy"
fi;

ADDON_DIR=${PWD##*/}
ADDON_TEST_PATH=$(bash "$GITHUB_ACTION_PATH/bin/detect-tests-path.sh")
REAL_ADDON_TYPE=$(bash "$GITHUB_ACTION_PATH/bin/detect-addon-type.sh" "$ADDON_TYPE" "$DETECTED_TYPE")
ADDON_TYPE_PATH=$(bash "$GITHUB_ACTION_PATH/bin/detect-addon-type-path.sh" "$REAL_ADDON_TYPE")

echo "::set-output name=addon_dir::$ADDON_DIR"
echo "::set-output name=addon_test_path::$ADDON_TEST_PATH"
echo "::set-output name=addon_type::$REAL_ADDON_TYPE"
echo "::set-output name=addon_type_path::$ADDON_TYPE_PATH"
echo "::set-output name=addon_install_path::$ADDON_TYPE_PATH/$ADDON_DIR"