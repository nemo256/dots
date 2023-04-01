<div align="center">

# `dots`

<h3>
  My dotfiles
</h3>

<!-- Badges -->
![GitHub Repo stars](https://img.shields.io/github/stars/nemo256/dots?style=for-the-badge)
![Maintenance](https://shields.io/maintenance/yes/2022?style=for-the-badge)
![License](https://shields.io/github/license/nemo256/dots?style=for-the-badge)

<!-- Demo image -->
![Demo](demo.gif)

</div>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [Project Structure 📁](#project-structure)
* [Install 🔨](#install)
* [Usage 🚀](#usage)
* [Tily Guide 💻](#tily)
* [License 📑](#license)

## Project Structure 📁
```
dots/
├── config/*   (configuration files)
│   ├── bash
│   ├── mpv
│   ├── nvim
│   └── ...
├── AUTHORS
├── LICENSE
├── README.md
├── TODO.md
├── demo.gif
├── packages
└── setup
```

## Install [Archlinux](https://archlinux.org/) 🔨
- Follow this guide to create a bootable USB: [USB flash installation medium](https://wiki.archlinux.org/title/USB_flash_installation_medium)
- Boot inside the arch installation.
- Install arch using the archinstall command (you can check my install configuration at [N3m0's archinstall config](https://github.com/nemo256/arch))
```shell
$ pacman -Sy git (or wget)
```
- Download the archinstall config, Using git:
```shell
$ git clone https://github.com/nemo256/arch
$ cd arch
```
- Using curl:
```shell
$ curl -O https://raw.githubusercontent.com/nemo256/arch/master/n3m0_config.json
$ curl -O https://raw.githubusercontent.com/nemo256/arch/master/n3m0_disk_layouts.json
```
- Launch the arch installer:
```shell
$ archinstall --config n3m0_config.json --disk_layouts n3m0_disk_layouts.json
```

## Usage 🚀
> This is used on a fresh arch linux install!
- Clone the repo:
```shell
$ git clone https://github.com/nemo256/dots
```
- Run the setup script:
```shell
$ cd dots
$ chmod +x setup
$ ./setup
```
## Tily Guide 💻

- Tily is my custom fork (config) of dwm.
- I mainly use monocle mode, so what works for me might not work for you.
- Note that SUPER (Mod4) is the windows key in most machines.

## License 📑
- Please read [dots/LICENSE](https://github.com/nemo256/dots/blob/master/LICENSE)
