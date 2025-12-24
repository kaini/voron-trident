#!/bin/bash
set -euxo pipefail

pushd ~/klipper

make clean
make menuconfig KCONFIG_CONFIG=/home/michael/printer_data/config/ebb36_v1_2.config
make -j$(nproc) KCONFIG_CONFIG=/home/michael/printer_data/config/ebb36_v1_2.config

make clean
make menuconfig KCONFIG_CONFIG=/home/michael/printer_data/config/esp32s3_ebbev1_2.config

popd