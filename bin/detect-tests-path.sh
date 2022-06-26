#!/usr/bin/env bash

if [ -d "tests" ]; then
  echo "./tests/"
elif [ -d "test" ]; then
  echo "./test/"
fi;