#!/usr/bin/env bash

INSTALL_PATH="$1"
INSTALL_VERSION="$2"

composer create-project --stability=dev impresscms/impresscms "$INSTALL_PATH" "$INSTALL_VERSION"