# Lumaeris' BlueBuild Config &nbsp; [![bluebuild build badge](https://github.com/Lumaeris/bluebuild-config/actions/workflows/build.yml/badge.svg)](https://github.com/Lumaeris/bluebuild-config/actions/workflows/build.yml)

This repository contains a recipe for [BlueBuild](https://blue-build.org/) that does a build based on my preferences.

This is based on the [Universal Blue's](https://universal-blue.org/) [`bazzite-nvidia-open`](https://github.com/ublue-os/bazzite/pkgs/container/bazzite-nvidia-open) image, which contains NVIDIA driver with open-source modules that only supports NVIDIA RTX or NVIDIA GTX 16xx+ Series. Not recommended for use as is, while still allowing you to explore this repository.

See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for quick setup instructions for setting up your own repository based on BlueBuild's template.

## List of packages
### Added
| Name | Repo |
| --- | --- |
| [Mullvad VPN](https://mullvad.net/en/vpn) | [Official](https://mullvad.net/en/download/vpn/linux) |
| [Free Download Manager](https://www.freedownloadmanager.org/) | N/A, [directly from file](https://www.freedownloadmanager.org/download-fdm-for-linux.htm) |
| [Docker Engine](https://docs.docker.com/engine/) | [Official](https://docs.docker.com/engine/install/fedora/) |

## Installation

To rebase an existing atomic Fedora installation to the latest build of `bazzite-nvidia-open` (main):

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```bash
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/lumaeris/bazzite-nvidia-open:latest
  ```
- Reboot, and complete the rebase to the signed image:
  ```bash
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/lumaeris/bazzite-nvidia-open:latest
  ```

The `latest` tag will automatically point to the latest build.

After installation I install a few Flatpak applications (that I don't include in the images yet) and apply these commands:

```bash
ujust setup-virtualization # Enable Virtualization, Add $USER to libvirt group, Enable USB hot plugging

ujust setup-spotify # also installs and configures spicetify automatically

ujust install-resolve
```

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/lumaeris/bazzite-nvidia-open
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
