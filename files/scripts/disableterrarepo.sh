#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

dnf config-manager --set-disabled terra
dnf config-manager --set-disabled terra-extras
