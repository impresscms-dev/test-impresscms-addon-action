#!/usr/bin/env bash

ADDON_TYPE="$1"
ADDON_NAME="$2"
INSTALLATION_PATH="$3"

mkdir -p "$INSTALLATION_PATH" || true

cp -r ./* "$INSTALLATION_PATH/"
php bin/console $ADDON_TYPE:install $ADDON_NAME