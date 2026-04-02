#!/usr/bin/env bash

# Check if bluetooth is powered on
power_state=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [[ "$power_state" != "yes" ]]; then
    echo "Off"
    exit 0
fi

# Get connected devices
connected_devices=$(bluetoothctl devices Connected | cut -d ' ' -f3-)

if [[ -n "$connected_devices" ]]; then
    # If multiple devices, join with commas
    echo "$connected_devices" | paste -sd ", " -
else
    # Bluetooth is on but no active connections
    echo "On"
fi
