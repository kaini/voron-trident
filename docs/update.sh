#!/bin/bash
set -euxo pipefail

sudo systemctl stop klipper

pushd ~/klipper

make clean
make menuconfig KCONFIG_CONFIG=/home/michael/printer_data/config/ebb36_v1_2.config
make -j$(nproc) KCONFIG_CONFIG=/home/michael/printer_data/config/ebb36_v1_2.config
python3 ~/katapult/scripts/flashtool.py -i can0 -r -u 3a2796fbabe3

make clean
make menuconfig KCONFIG_CONFIG=/home/michael/printer_data/config/m8p.config
make -j$(nproc) KCONFIG_CONFIG=/home/michael/printer_data/config/m8p.config

popd

sudo systemctl start klipper
