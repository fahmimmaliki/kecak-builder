#!/bin/bash
KECAK_REPO="git@gitlab.com:kinnarastudio/kecak-workflow.git"
GET_BUILD_NUMBER=$(curl -s 'https://sandbox.kecak.org//web/json/build/info' | jq -r '.buildNumber')

# clone repository if kecak-worflow directory doesn't exist
[ -d kecak-workflow ] || git clone $KECAK_REPO

# build core kecak-workflow
cd kecak-workflow && git checkout $GET_BUILD_NUMBER
cd wflow-app && sh kecak_make.sh