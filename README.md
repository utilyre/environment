# Environment

Utilyre's composable Linux setup.

## Installation

> [!NOTE]
> Make sure you have [`stow`][stow] installed on your system.

Clone the repository:

```bash
git clone https://github.com/utilyre/environment.git ~/path/to/environment
```

Create symbolic links of dotfiles:

```bash
make install
```

[stow]: https://gnu.org/software/stow

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
