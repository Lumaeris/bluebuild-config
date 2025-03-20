#!/usr/bin/env bash
# thx to https://github.com/HikariKnight/Deckstation/blob/main/files/scripts/main/deckstation-setup.sh for this hacky fix!

# Tell this script to exit if there are any errors.
set -oue pipefail

# tell ublue-update that it should check updates from my image, NOT the official ones
IMAGE_REF="ostree-image-signed:docker://ghcr.io/lumaeris/bazzite-deck"
printf '{\n"image-ref": "'"$IMAGE_REF"'",\n"image-tag": "latest",\n"image-name": "bazzite-deck"\n}' > /usr/share/ublue-os/image-info.json
