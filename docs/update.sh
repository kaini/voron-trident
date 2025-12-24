#!/bin/bash
set -euxo pipefail

sudo systemctl stop klipper

pushd ~/klipper

make clean
make menuconfig KCONFIG_CONFIG=/home/michael/printer_data/config/ebb36_v1_2.config
make -j$(nproc) KCONFIG_CONFIG=/home/michael/printer_data/config/ebb36_v1_2.config
python3 ~/katapult/scripts/flashtool.py -i can0 -r -u 3a2796fbabe3
python3 ~/katapult/scripts/flashtool.py -i can0 -f ~/klipper/out/klipper.bin -u 3a2796fbabe3

make clean
make menuconfig KCONFIG_CONFIG=/home/michael/printer_data/config/m8p.config
make -j$(nproc) KCONFIG_CONFIG=/home/michael/printer_data/config/m8p.config
python3 ~/katapult/scripts/flashtool.py -i can0 -r -u acad98aaf678
python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/usb-katapult_acad98aaf678

popd

sudo systemctl start klipper
