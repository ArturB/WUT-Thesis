#!/bin/bash

BUILD_ID=$( date +%H:%M-%d.%m.%Y )

git add -A; git commit -qam "Build $BUILD_ID"; git pull; git push
