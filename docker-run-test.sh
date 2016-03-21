#!/usr/bin/env bash

docker run --net=host -e http_proxy -e https_proxy -e no_proxy -i orangeopensource/zulu-openjdk-resource:test /opt/resource-test/run-local-test.sh