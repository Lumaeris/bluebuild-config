#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

mkdir -p /etc/systemd/resolved.conf.d
tee /etc/systemd/resolved.conf.d/00-custom.conf << EOF > /dev/null
[Resolve]
DNS=9.9.9.9#dns.quad9.net 149.112.112.112#dns.quad9.net 2620:fe::fe#dns.quad9.net 2620:fe::9#dns.quad9.net
DNSOverTLS=yes
EOF
