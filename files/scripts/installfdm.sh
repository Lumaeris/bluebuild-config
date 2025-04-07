#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

pushd . > /dev/null
dir="$(mktemp -d)"
cd "${dir}"
wget https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb
ar x freedownloadmanager.deb
tar -xvJf data.tar.xz -C /
sed -i '/^Exec=/ s/^Exec=/&env QT_QPA_PLATFORM=xcb /' /usr/share/applications/freedownloadmanager.desktop
mv /opt/freedownloadmanager /usr/lib/opt/
popd > /dev/null
rm -rf "${dir}"
