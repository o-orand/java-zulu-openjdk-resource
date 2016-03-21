#!/usr/bin/env bash

docker run --net=host -e http_proxy -e https_proxy -e no_proxy -v $(pwd)/:/root/ -i orangeopensource/zulu-openjdk-resource /bin/sh