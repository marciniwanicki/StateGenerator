#!/bin/bash

set -e

SWIFTLINT_PKG_PATH="/tmp/SwiftLint.pkg"
SWIFTLINT_PKG_URL="https://github.com/realm/SwiftLint/releases/download/0.22.0/SwiftLint.pkg"

wget --output-document=$SWIFTLINT_PKG_PATH $SWIFTLINT_PKG_URL

if [ -f $SWIFTLINT_PKG_PATH ]; then
  sudo installer -pkg $SWIFTLINT_PKG_PATH -target /
else
  git clone https://github.com/realm/SwiftLint.git /tmp/SwiftLint &&
  cd /tmp/SwiftLint &&
  git submodule update --init --recursive &&
  sudo make install
fi
