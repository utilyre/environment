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

Next, when you have successfully set Arch Linux up and have rebooted, install
an [AUR helper](https://wiki.archlinux.org/title/AUR_helpers) as the required
minimal package list of this repository may contain packages from the [Arch User
Repository](https://aur.archlinux.org).

Then, clone this repository once again and install the packages listed inside
[minimal.list](./packages/minimal.list) using your favorite AUR helper. In
addition, create symbolic links of the provided dotfiles by running `make
install`.

> [!TIP]
> There exists other package lists as well inside the [packages](./packages)
> directory for more specialized needs.

Finally, make sure to adhere to the [System
maintenance](https://wiki.archlinux.org/title/System_maintenance) guidelines in
order to maintain a stable and reliable system setup.

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
_cannot_ be specified with their corresponding UUIDs.

### Smooth login

Logging in to your system when you are not using a display manager could become
quite cumbersome, especially if you have disk encryption set up.

To address this, skip the GRUB menu shown at boot by setting the value of
`GRUB_TIMEOUT` in `/etc/default/grub` to `0`. Once set, run `grub-mkconfig
-o /boot/grub/grub.cfg` with root privileges to regenerate the main GRUB
configuration file.

Optionally, enable getty autologin and skip the tty prompt entirely:

###### `/etc/systemd/system/getty@tty1.service.d/autologin.conf`
```
[Service]
ExecStart=
ExecStart=-/sbin/agetty --noreset --noclear --autologin <USERNAME> - ${TERM}
```

Make sure to replace `<USERNAME>` with your own username.

### Dark mode

Switching to dark mode is pretty straight forward on Linux nowadays. All that
needs to be done is to run the commands below:

```bash
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
```

> [!NOTE]
> Applications should take effect instantly, if this was not the case, try
> restarting them.

### Disk encryption via LVM2

### Smooth login experience

### GNOME Keyring

### Dark mode

## Todo

Further improvements:
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
