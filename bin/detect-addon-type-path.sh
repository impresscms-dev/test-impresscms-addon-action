#!/usr/bin/env bash

ADDON_TYPE="$1"
case "$ADDON_TYPE" in

  module)
      echo "./modules/"
      ;;

  theme)
    if [ -f "./themes" ]; then
      echo "./htdocs/themes/"
    else
      echo "./themes/"
    fi;
      ;;

  translation)
      echo "./translations/"
      ;;

  *)
      exho "ERROR: can't resolve type path"
      exit 1
      ;;
esac