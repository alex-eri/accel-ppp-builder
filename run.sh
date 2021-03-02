#!/bin/bash

mkdir -p ${PWD}/build
docker build -t accell-ppp-builder $(dirname "$0")

docker run -it  -v ${PWD}/build:/build accell-ppp-builder
