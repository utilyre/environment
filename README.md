# environment

This is a collection of dotfiles, package lists, and guides for setting up an
Arch Linux instance that is desireable for me.

## Features

- Low resource utilization
- Disk encryption
- Dark mode
- Laptop-friendly

## Installation

To begin, [grab the latest Arch Linux ISO](https://archlinux.org/download/)
and write it to a USB stick. Boot up your computer into the
live image and generally follow the steps of [Installation
Guide](https://wiki.archlinux.org/title/Installation_guide)
in conjunction with a video tutorial, such as [this one from
DenshiVideo](https://youtu.be/kXqk91R4RwU), as the official installation guide
does not go very deep into some of the technologies needed for our final setup.
It is also recommended to clone this repository in the live image to access some
of its assets, especially [bootstrap.list](./packages/bootstrap.list).

Next, when you have successfully set Arch Linux up, clone this repository once
again and install the packages listed inside [minimal.list](./packages/minimal).
In addition, create symbolic links of the provided dotfiles by running `make
install`.

## Beyond environment

### Memory compression via ZRAM

### Disk encryption via LVM2

### Smooth login experience

### GNOME Keyring

### Dark mode

## Todo

Further improvements:
- memory compression via zram (https://wiki.archlinux.org/title/Zram#Using_a_udev_rule)
- disk encryption via lvm2
- Smooth login experience
  1. Skip grub menu (GRUB_TIMEOUT=0 in /etc/default/grub)
  2. Enable getty autologin (https://wiki.archlinux.org/title/Getty#Virtual_console)

Guide:
- What to install when bootstrapping arch and how to install the minimal package list
- GNOME Keyring stuff for GPG and SSH (https://wiki.archlinux.org/title/GNOME/Keyring)
- Dark mode switching (https://wiki.archlinux.org/title/Dark_mode_switching#gsettings)
