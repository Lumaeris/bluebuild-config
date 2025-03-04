#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

mkdir -p /usr/lib/librewolf
ln -s /usr/lib/mozilla/native-messaging-hosts /usr/lib/librewolf/native-messaging-hosts
