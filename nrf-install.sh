#!/bin/bash

# https://docs.nordicsemi.com/bundle/ncs-latest/page/zephyr/develop/getting_started/index.html

cd ~/zephyrproject

python3 -m venv ./venv
. venv/bin/activate
pip install west

echo initializing...
west init ~/zephyrproject

echo updating...
cd ~/zephyrproject
west update 

echo exporting...
west zephyr-export 

echo installing pip dependencies...
west packages pip --install

# Install Zephyr SDK

cd ~/zephyrproject/zephyr
west sdk install
