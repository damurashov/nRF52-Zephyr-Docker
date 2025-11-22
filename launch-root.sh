#!/bin/bash

mkdir -p ./zephyrproject
docker run --user root -it -v $PWD/zephyrproject:/home/nrf52/zephyrproject nrf-build-environment
