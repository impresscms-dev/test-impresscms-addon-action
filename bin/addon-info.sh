#!/usr/bin/env bash

ADDON_TYPE="$1"

if [ -f "composer.json" ]; then
  echo "addon_name=$(composer config name)" >> $GITHUB_OUTPUT
  ADDON_INSTALL_TYPE=composer
  DETECTED_TYPE=$(composer config type)
else
  DETECTED_TYPE="impresscms-module"
  ADDON_INSTALL_TYPE=legacy
fi;

REAL_ADDON_TYPE=$(bash "$GITHUB_ACTION_PATH/bin/detect-addon-type.sh" "$ADDON_TYPE" "$DETECTED_TYPE")
ADDON_DIR=$(bash "$GITHUB_ACTION_PATH/bin/detect-addon-dir.sh" "$ADDON_INSTALL_TYPE" "$REAL_ADDON_TYPE")
ADDON_TEST_PATH=$(bash "$GITHUB_ACTION_PATH/bin/detect-tests-path.sh")
ADDON_TYPE_PATH=$(bash "$GITHUB_ACTION_PATH/bin/detect-addon-type-path.sh" "$REAL_ADDON_TYPE")

echo "addon_dir=$ADDON_DIR" >> $GITHUB_OUTPUT
echo "addon_test_path=$ADDON_TEST_PATH" >> $GITHUB_OUTPUT
echo "addon_type=$REAL_ADDON_TYPE" >> $GITHUB_OUTPUT
echo "addon_type_path=$ADDON_TYPE_PATH" >> $GITHUB_OUTPUT
echo "addon_installation_type=$ADDON_INSTALL_TYPE" >> $GITHUB_OUTPUT
echo "addon_install_path=$ADDON_TYPE_PATH/$ADDON_DIR" >> $GITHUB_OUTPUT