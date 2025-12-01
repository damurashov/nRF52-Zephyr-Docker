#!/bin/bash

mkdir -p ./zephyrproject
docker run --user nrf52 -it -v $PWD/zephyrproject:/home/nrf52/zephyrproject nrf-build-environment \
	bash -c 'export ZEPHYR_BASE=/home/nrf52/zephyrproject/toolchains; \
	. ~/zephyrproject/venv/bin/activate; cd ~ ; /bin/bash'
