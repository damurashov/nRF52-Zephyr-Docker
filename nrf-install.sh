#!/bin/bash

# https://docs.nordicsemi.com/bundle/ncs-latest/page/zephyr/develop/getting_started/index.html

cd ~/zephyrproject

python3 -m venv ./venv
. venv/bin/activate
pip install west

echo initializing...
west init ~/zephyrproject

echo checking onto release tag...
cd ~/zephyrproject/zephyr
git checkout v4.3.0

echo updating...
cd ~/zephyrproject
west update 

echo exporting...
west zephyr-export 

echo installing pip dependencies...
# instead of `west packages pip --install` -- it's broken (2025-11)
pip install -r /home/nrf52/requirements/requirements.txt

# Install Zephyr SDK
# TODO: It downloads the entire package from
# https://github.com/zephyrproject-rtos/sdk-ng/releases/tag/v0.17.4 which results in a couple of GB.
# Download toolchains for NRF (arm zephyr), "host tools", and be done with it;

cd ~/zephyrproject/zephyr
west sdk install
