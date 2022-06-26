#!/usr/bin/env bash

ADDON_INSTALL_TYPE="$1"
ADDON_TYPE="$2"
ADDON_DIR="${PWD##*/}"

if [ "$ADDON_INSTALL_TYPE" != "composer" ]; then
  echo "$ADDON_DIR"
  exit 0
fi

if [ "$ADDON_TYPE" != "translation" ]; then
  php "${GITHUB_ACTION_PATH}/bin/detect-${ADDON_TYPE}-dir.php" "$ADDON_DIR"
else
  composer config extra.language
fi