ZSH_CACHE="$XDG_CACHE_HOME/zsh" && mkdir -p -- "$ZSH_CACHE"
ZSH_DATA="$XDG_DATA_HOME/zsh" && mkdir -p -- "$ZSH_DATA"

use() {
	plugin="$ZSH_DATA/${1##*/}"
	[ ! -d "$plugin" ] && {
		printf "\e[33m\e[m \e[1m%s\e[m" "$1"
		error="$(git clone --depth=1 -- "https://github.com/$1.git" "$plugin" 2>&1)" &&
			printf "\r\e[32m\e[m %s\n" "$1" || {
				printf "\r\e[31m\e[m %s\n" "$1"
				printf "\e[31m%s\e[m\n\n" "$(echo "$error" | sed "s/^/> /")"

				read -sk "?[Press any key to exit]"
				exit 1
			}
	}

	. -- "$plugin/$2"
}

export LS_COLORS="no=0;37:fi=0;37:ex=0;32:so=0;35:do=0;35:pi=0;33:ln=0;36:or=0;31:mi=0;31:di=1;34:tw=1;32:ow=1;32:st=1;32:cd=1;33:bd=1;37"
export LESS="-FXR -DdC* -Duc_"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ls="ls --color=auto -thA"
alias ll="ls -lr"

stty -ixon
bindkey -e

setopt incappendhistory
setopt histignorespace
setopt histignorealldups
HISTSIZE=100
SAVEHIST=65536
HISTFILE="$XDG_STATE_HOME/zshhst"

setopt globcomplete
setopt globdots
setopt nolisttypes
FPATH="$ZDOTDIR/completions:$FPATH"
use zsh-users/zsh-completions zsh-completions.plugin.zsh
zmodload zsh/complist
autoload compinit
compinit -d "$ZSH_CACHE/zcompdump"
zstyle ":completion:*" menu select
zstyle ":completion:*" file-sort mtime
zstyle ":completion:*" matcher-list "m:{[:lower:]}={[:upper:]}"
zstyle ":completion:*" list-colors "$LS_COLORS"

PROMPT="%F{%(?:2:1)}➜%f%(?:: %B%F{1}%?%f%b) %B%F{6}%c%f%b\$(gitprompt) "
PROMPT_EOL_MARK="%F{8}%f"
ZSH_GIT_PROMPT_SHOW_STASH=true
ZSH_THEME_GIT_PROMPT_PREFIX=" %F{4}(%f"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{4})%f"
ZSH_THEME_GIT_PROMPT_SEPARATOR=
ZSH_THEME_GIT_PROMPT_BRANCH="%F{3}%f %F{5}"
ZSH_THEME_GIT_PROMPT_DETACHED="%F{3}%f %F{5}"
ZSH_THEME_GIT_PROMPT_BEHIND="%F{1}↓"
ZSH_THEME_GIT_PROMPT_AHEAD="%F{2}↑"
ZSH_THEME_GIT_PROMPT_CLEAN=
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{1}?"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%F{1}!"
ZSH_THEME_GIT_PROMPT_STAGED="%F{2}+"
ZSH_THEME_GIT_PROMPT_STASHED="%F{6}\$"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{3}="
use woefe/git-prompt.zsh git-prompt.plugin.zsh
substitute-prompt-and-accept-line() {
	prev="$PROMPT"
	PROMPT="%F{%(?:2:1)}%(!.#.\$)%f "
	zle reset-prompt
	PROMPT="$prev"
	unset prev
	zle accept-line
}
zle -N substitute-prompt-and-accept-line
bindkey ^M substitute-prompt-and-accept-line
