#!/bin/sh

speed=$(awk 'FNR == 2 {print $2}' /proc/acpi/ibm/fan)
echo "Fan Speed: $speed"
