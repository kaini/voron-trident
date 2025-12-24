#!/bin/bash
set -euxo pipefail

sudo systemctl stop klipper

pushd ~/klipper

make clean
make menuconfig KCONFIG_CONFIG=/home/michael/printer_data/config/ebb36_v1_2.config
make -j$(nproc) KCONFIG_CONFIG=/home/michael/printer_data/config/ebb36_v1_2.config

make clean
make menuconfig KCONFIG_CONFIG=/home/michael/printer_data/config/m8p.config
make -j$(nproc) KCONFIG_CONFIG=/home/michael/printer_data/config/m8p.config

popd

sudo systemctl start klipper
