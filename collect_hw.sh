#!/bin/sh

EEPROM="/sys/bus/i2c/devices/1-0050/eeprom"

if [ ! -f "${EEPROM}" ]; then
  EEPROM="/sys/bus/i2c/devices/0-0050/eeprom"
  echo "[`date --iso-8601=ns`] Failed to Find i2c eeprom on 1-0050 " >> master_install_log
fi

if [ ! -f "${EEPROM}" ]; then
  echo "Failed to Find i2c eeprom on 0-0050..."
  echo "[`date --iso-8601=ns`] Failed to Find i2c eeprom on 0-0050 " >> master_install_log
  exit 1
fi

SERIAL=$(hexdump -e '8/1 "%c"' "${EEPROM}" -s 16 -n 12 2>&1)
VERSION=$(hexdump -e '8/1 "%c"' "${EEPROM}" -s 13 -n 3 2>&1)

if [ "${SERIAL}" = "${SERIAL#*BB}" ]; then
  echo "Failed to extract Serial Number and Version..."
  echo "[`date --iso-8601=ns`] Failed to extract Serial Number and Version " >> master_install_log
  exit 1
fi

echo  "Beaglebone Serial Number: " "${SERIAL}" 
echo  "Beaglebone Version: " "${VERSION}"
echo  "[`date --iso-8601=ns`] Beaglebone Serial Number: " "${SERIAL}" >> master_install_log
echo  "[`date --iso-8601=ns`] Beaglebone Version: " "${VERSION}" >> master_install_log
