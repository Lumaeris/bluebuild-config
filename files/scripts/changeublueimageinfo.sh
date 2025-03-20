#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

# tell ublue-update that it should check updates from my image, NOT the official ones
cat > /usr/share/ublue-os/image-info.json <<EOF
{
  "image-name": "bazzite-deck",
  "image-flavor": "deck",
  "image-vendor": "lumaeris",
  "image-ref": "ostree-image-signed:docker://ghcr.io/lumaeris/bazzite-deck",
  "image-tag": "latest",
  "image-branch": "latest",
  "base-image-name": "kinoite",
  "fedora-version": "41"
}
EOF
