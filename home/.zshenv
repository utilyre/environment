export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export PATH="$HOME/.local/bin:$PATH"

export EDITOR=helix
export GROFF_NO_SGR=1
export BEMENU_OPTS='-iwP> --single-instance --ifne --fixed-height --scrollbar=always -H26 --cw=1 --ch=18'
export PASSWORD_STORE_GENERATED_LENGTH=64
export PASSWORD_STORE_CHARACTER_SET='[:graph:]'

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
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
