#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

pushd . > /dev/null
dir="$(mktemp -d)"
cd "${dir}"
wget https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-mocha.zip
unzip catppuccin-mocha.zip -d /usr/share/sddm/themes/
sed -i 's/\#Current=01-breeze-fedora/Current=catppuccin-mocha/g' /etc/sddm.conf
popd > /dev/null
rm -rf "${dir}"
