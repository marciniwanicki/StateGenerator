#!/bin/bash

set -e

if which swiftlint >/dev/null; then
  if [ ! -d Sources ]; then
    cd ..
  fi

  swiftlint
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
