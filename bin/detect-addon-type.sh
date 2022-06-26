#!/usr/bin/env bash

ADDON_TYPE="$1"
DETECTED_TYPE="$2"

if [ -z "$ADDON_TYPE" ]; then
  case "$DETECTED_TYPE" in

    impresscms-module)
      echo "module"
      ;;

    impresscms-theme)
      echo "theme"
      ;;

    impresscms-translation)
      echo "translation"
      ;;

    *)
      echo "unknown"
      ;;
  esac
else
  echo "$ADDON_TYPE"
fi;