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
ensure a stable and reliable system setup.

## Further Improvements

### On-the-fly RAM compression

The [zram kernel module](https://docs.kernel.org/admin-guide/blockdev/zram.html)
creates RAM-based block devices which can be used for swap or as a
general-purpose RAM disk. The simplest way to use zram as a swap device is as
follows.

First, explicitly enable the module to be loaded at boot:

###### `/etc/modules-load.d/zram.conf`
```
zram
```

Then, define a udev rule and adjust its `disksize` attribute to your preference:

###### `/etc/udev/rules.d/99-zram.rules`
```
ACTION=="add", KERNEL=="zram0", ATTR{initstate}=="0", ATTR{comp_algorithm}="zstd", ATTR{disksize}="4G", TAG+="systemd"
```

Finally, add a swap entry to your fstab configuration to use zram as a swap
device:

###### `/etc/fstab`
```
/dev/zram0 none swap defaults,discard,pri=100,x-systemd.makefs 0 0
```

Please note that zram devices are not persistent block devices; therefore, they
cannot be specified with their corresponding UUIDs.

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
