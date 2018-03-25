#!/bin/bash

set -e

if [ ! -d Sources ]; then
  cd ..
fi

xcodebuild -workspace StateGenerator.xcworkspace -scheme StateGeneratorExamples -sdk iphonesimulator build -destination "platform=iOS Simulator,name=iPhone SE" | xcpretty -c
