[ "$ZSHENV" ] && return
export ZSHENV="1"

# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export PATH="$HOME/.local/bin:$PATH"

# utils
export EDITOR="hx"
export GROFF_NO_SGR="1"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config.ini"

# pass
export PASSWORD_STORE_GENERATED_LENGTH="64"
export PASSWORD_STORE_CHARACTER_SET="[:graph:]"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/vault"

# go
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$GOPATH/bin:/usr/local/go/bin:$PATH"

# node
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node/history"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PNPM_HOME:$PATH"

# rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PATH="$CARGO_HOME/bin:$PATH"
