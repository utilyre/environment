# Please note that this file is sourced once per login as it changes ZDOTDIR to
# somewhere else.

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export PATH="$HOME/.local/bin:$PATH"

export EDITOR=helix
export LESS="-FRM -DdC* -Duc_"
export BEMENU_OPTS='-iwP> --single-instance --ifne --fixed-height --scrollbar=always -H26 --ch=18'
export LS_COLORS="no=0;37:fi=0;37:ex=0;32:so=0;35:do=0;35:pi=0;33:ln=0;36:or=0;31:mi=0;31:di=1;34:tw=1;32:ow=1;32:st=1;32:cd=1;33:bd=1;37"

# Make sure man pages have color on some distributions like Fedora
export GROFF_NO_SGR=1

export PASSWORD_STORE_GENERATED_LENGTH=64
export PASSWORD_STORE_CHARACTER_SET='[:graph:]'

# Run electron applications on Wayland
export ELECTRON_OZONE_PLATFORM_HINT=auto

# Change home of zsh, causes this file to be sources exactly once per login
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WOB_PIPE="$XDG_RUNTIME_DIR/wob.fifo"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/vault"
export LF_CACHE="$XDG_CACHE_HOME/lf"
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config.ini"
export CPM_SOURCE_CACHE="$XDG_CACHE_HOME/cpm"
export PATH="$XDG_DATA_HOME/JetBrains/Toolbox/scripts:$PATH"

[ -d /usr/local/go/bin ] && export PATH="/usr/local/go/bin:$PATH"
[ -d "$HOME/go/bin" ] && export PATH=""$HOME/go/bin":$PATH"
[ -d "$XDG_DATA_HOME/pnpm" ] && export PATH="$XDG_DATA_HOME/pnpm:$PATH"
[ -d "$HOME/.cargo/bin" ] && export PATH="$HOME/.cargo/bin:$PATH"
[ -f "$XDG_DATA_HOME/vulkansdk/default/setup-env.sh" ] && source "$XDG_DATA_HOME/vulkansdk/default/setup-env.sh"
