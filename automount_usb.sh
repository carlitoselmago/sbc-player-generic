#!/bin/bash

# Create mount directory if it doesn't exist
mkdir -p /media/usb

# Check if any USB devices are present
if ls /dev/sd*1 1> /dev/null 2>&1; then
    for dev in /dev/sd*1; do
        # Skip mounted devices
        if mount | grep -q "^$dev "; then
            continue
        fi

        # Mount to /media/usb
        mount "$dev" /media/usb
    done
else
    echo "No USB devices found to mount."
fi
