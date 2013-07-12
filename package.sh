#!/usr/bin/env bash


mkdir pivotal_tracker_enhancements
cp manifest.json pivotal_tracker_enhancements/
cp zepto.js pivotal_tracker_enhancements/
coffee -cbp main.coffee > pivotal_tracker_enhancements/main.js

/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --pack-extension=pivotal_tracker_enhancements/ --pack-extension-key=pivotal_tracker_enhancements.pem

