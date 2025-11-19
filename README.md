# environment

This is a collection of dotfiles, package lists, and guides for setting up an
Arch Linux instance that is desireable for _me_.

## Features

- Low resource utilization
- Disk encryption
- Dark mode
- Laptop-friendly

## Installation

To begin, grab the [latest Arch Linux ISO](https://archlinux.org/download)
and write it to a USB stick. Boot up your computer into the
live image and generally follow the steps of the [Installation
Guide](https://wiki.archlinux.org/title/Installation_guide)
in conjunction with a video tutorial, such as [this one by
DenshiVideo](https://youtu.be/kXqk91R4RwU), as the official guide does not go
very deep into some of the technologies needed for our final setup. It is also
recommended to clone this repository within your live image in order to access
some of its assets, especially [bootstrap.list](./packages/bootstrap.list).

Next, when you have successfully set Arch Linux up and have rebooted, clone this
repository once again and [install](https://wiki.archlinux.org/title/Install)
the packages listed inside [minimal.list](./packages/minimal.list). In addition,
create symbolic links of the provided dotfiles by running `make install`.

Finally, adhere to the [System
maintenance](https://wiki.archlinux.org/title/System_maintenance) guidelines to
ensure having a stable and reliable system setup.

## Further Improvements

### On-the-fly RAM compression

[Enable zram kernel module at boot with a single udev rule and fstab
entry](https://wiki.archlinux.org/title/Zram#Using_a_udev_rule).

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
- power management through tlp
  1. https://linrunner.de/tlp/support/optimizing.html#extend-battery-runtime
  2. https://linrunner.de/tlp/faq/battery.html

Guide:
- What to install when bootstrapping arch and how to install the minimal package list
- GNOME Keyring stuff for GPG and SSH (https://wiki.archlinux.org/title/GNOME/Keyring)
- Dark mode switching (https://wiki.archlinux.org/title/Dark_mode_switching#gsettings)
