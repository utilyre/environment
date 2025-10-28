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

- GNOME Keyring stuff for GPG and SSH
- Dark mode switching (https://wiki.archlinux.org/title/Dark_mode_switching#gsettings)
