# Lumaeris' BlueBuild Config &nbsp; [![bluebuild build badge](https://github.com/Lumaeris/bluebuild-config/actions/workflows/build.yml/badge.svg)](https://github.com/Lumaeris/bluebuild-config/actions/workflows/build.yml)

This repository contains a recipe for [BlueBuild](https://blue-build.org/) that does a build based on my preferences.

This is based on the [Universal Blue's](https://universal-blue.org/) [`bazzite-nvidia-open`](https://github.com/ublue-os/bazzite/pkgs/container/bazzite-nvidia-open) and [`bazzite-deck`](https://github.com/ublue-os/bazzite/pkgs/container/bazzite-deck) images, the first one contains NVIDIA driver with open-source modules that only supports NVIDIA RTX or NVIDIA GTX 16xx+ Series and the second one contains specific changes for Steam Deck. Not recommended for use as is, while still allowing you to explore this repository.

See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for quick setup instructions for setting up your own repository based on BlueBuild's template.

## List of packages
### Added
| Name | Repo | Present on main | Present on deck |
| --- | --- | --- | --- |
| [`steamos-update` via rpm-ostree](files/system/deck/usr/bin/steamos-update) | This repo, [based on Bazzite's script](https://github.com/ublue-os/bazzite/blob/main/system_files/deck/shared/usr/bin/steamos-update) | ❌ | ✅ |
| [Mullvad VPN](https://mullvad.net/en/vpn) | [Official](https://mullvad.net/en/download/vpn/linux) | ✅ | ✅ |

### Removed
- [Waydroid](https://waydro.id), which doesn't work on NVIDIA hardware (only on main)

## Installation

> [!NOTE]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable). Works fine if using Bazzite's official ISOs as a starting point.

To rebase an existing atomic Fedora installation to the latest build of `bazzite-nvidia-open` (main):

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/lumaeris/bazzite-nvidia-open:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/lumaeris/bazzite-nvidia-open:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

And for rebasing to the latest build of `bazzite-deck` (deck):

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/lumaeris/bazzite-deck:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/lumaeris/bazzite-deck:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/lumaeris/bazzite-nvidia-open
cosign verify --key cosign.pub ghcr.io/lumaeris/bazzite-deck
```

<p align="center">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Lumaeris/Lumaeris/refs/heads/main/assets/footer-white.png">
        <img alt="Lumaeris" width="600px" src="https://raw.githubusercontent.com/Lumaeris/Lumaeris/refs/heads/main/assets/footer-dark.png">
    </picture>
</p>
<p align="center">
    <a href="https://github.com/Lumaeris/bluebuild-config/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-Apache--2.0-ED592F?style=for-the-badge&logo=apache"/></a>
</p>
