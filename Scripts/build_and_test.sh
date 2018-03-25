#!/bin/bash

set -e

if [ ! -d Sources ]; then
  cd ..
fi

xcodebuild -workspace StateGenerator.xcworkspace -scheme StateGenerator -sdk iphonesimulator build test -destination "platform=iOS Simulator,name=iPhone SE" | xcpretty -c
