# environment

This is a collection of dotfiles, package lists, and guides for setting up an
Arch Linux instance that is desireable for _my personal use_.

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
maintenance](https://wiki.archlinux.org/title/System_maintenance) guidelines
and check `$XDG_STATE_HOME/sway.log` regularly in order to maintain a stable and
reliable system setup.

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
```fstab
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
```systemd
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

### GPG and SSH Agent

The only all-in-one, standalone solution that provides agents
for both GPG and SSH keys is without a doubt the [GNOME
Keyring](https://wiki.gnome.org/Projects/GnomeKeyring). It is a collection of
components in GNOME that store secrets, passwords, keys, certificates and make
them available to applications.

To set it up, edit `/etc/pam.d/login` and add `auth optional
pam_gnome_keyring.so` at the end of the `auth` section, in addition to `session
optional pam_gnome_keyring.so auto_start` at the end of the `session` section:

###### `/etc/pam.d/login`
```pamconf
#%PAM-1.0

auth       requisite    pam_nologin.so
auth       include      system-local-login
auth       optional     pam_gnome_keyring.so
account    include      system-local-login
session    include      system-local-login
session    optional     pam_gnome_keyring.so auto_start
password   include      system-local-login
```

The SSH functionality is disabled by default. To enable it, run the following
command with root privileges:

```bash
systemctl --user enable --now gcr-ssh-agent.socket
```

### Battery Care

If you are on a laptop and run out of battery frequently, use
[TLP](https://wiki.archlinux.org/title/TLP), a feature-rich command-line utility
for saving laptop battery power on Linux.

You can extend your battery's runtime by leaning the performance policies of
your CPU towards power-saving. [^1]

###### `/etc/tlp.conf`
```
CPU_ENERGY_PERF_POLICY_ON_BAT=power
```

Additionally, some hardware vendors provide the ability to set charge thresholds.
Inside `/etc/tlp.conf` find the entries for `START_CHARGE_THRESH_BAT0` and
`STOP_CHARGE_THRESH_BAT0` and set them according to [Battery Care Vendor
Specifics](https://linrunner.de/tlp/settings/bc-vendors). [^2]

### Chromium Extensions

- [uBlock Origin](https://ublockorigin.com): Free, open-source ad content blocker.

- [Dark Reader](https://darkreader.org): Open-source browser extension that
  creates dark themes for websites on the fly to reduce eye strain, especially
  at night.

- [GitHub Repo Size](https://github.com/AminoffZ/github-repo-size): An extension
  to display the size of GitHub repositories.

## License

This project is licensed under the [MIT License](./LICENSE), except for certain
directories that include their own separate license files, which take precedence
for the contents they cover.

[^1]: https://linrunner.de/tlp/support/optimizing
[^2]: https://linrunner.de/tlp/faq/battery
