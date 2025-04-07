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
stow -Rt ~ -d ~/path/to/environment home
```

[stow]: https://gnu.org/software/stow
