FROM ubuntu:22.04

ENV DEBIAN_FRONTEND="noninteractive"
RUN apt update
RUN apt install -y --no-install-recommends git cmake ninja-build gperf \
	ccache dfu-util device-tree-compiler wget python3-dev python3-venv python3-tk \
	xz-utils file make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1 python3-pip && \
	pip install west

ARG UID
ARG GID
ENV DOCKER_UID=$UID
ENV DOCKER_GID=$GID
RUN adduser --system --uid $DOCKER_UID --group --shell /bin/bash nrf52 && \
	mkdir -p /home/nrf52 && \
	chown -R nrf52 /home/nrf52 && \
	mkdir -p /home/nrf52/zephyrproject && \
	chown -R nrf52 /home/nrf52/zephyrproject
COPY nrf-install.sh /home/nrf52/
RUN chmod a+x /home/nrf52/nrf-install.sh
COPY nrfutil /home/nrf52
RUN chmod a+x /home/nrf52/nrfutil
USER nrf52
COPY requirements /home/nrf52/requirements
