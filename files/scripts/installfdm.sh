#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

pushd . > /dev/null
dir="$(mktemp -d)"
cd "${dir}"
wget https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb
ar x freedownloadmanager.deb
if [ ! -f '/opt' ]; then
    OPTF=1
fi
tar -xvJf data.tar.xz -C /
sed -i '/^Exec=/ s/^Exec=/&env QT_QPA_PLATFORM=xcb /' /usr/share/applications/freedownloadmanager.desktop
if [ "${OPTF}" -eq 1 ]; then
    mv /opt /usr/lib/
else
    mv /opt/freedownloadmanager /usr/lib/opt/
fi
popd > /dev/null
rm -rf "${dir}"
