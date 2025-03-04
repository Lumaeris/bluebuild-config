#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

rm -f /usr/share/applications/Waydroid.desktop
rm -rf /usr/lib/waydroid
rm -f /usr/bin/waydroid-choose-gpu
rm -f /usr/share/applications/waydroid-container-restart.desktop
