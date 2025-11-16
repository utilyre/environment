ZSH_CACHE="$XDG_CACHE_HOME/zsh" && mkdir -p -- "$ZSH_CACHE"
ZSH_DATA="$XDG_DATA_HOME/zsh" && mkdir -p -- "$ZSH_DATA"

use() {
	plugin="$ZSH_DATA/${1##*/}"
	[ ! -d "$plugin" ] && {
		printf '\e[33m\e[m \e[1m%s\e[m' "$1"
		error="$(git clone --depth=1 -- "https://github.com/$1.git" "$plugin" 2>&1)" &&
			printf '\r\e[32m\e[m %s\n' "$1" || {
				printf '\r\e[31m\e[m %s\n' "$1"
				printf '\e[31m%s\e[m\n\n' "$(echo "$error" | sed "s/^/> /")"

				read -sk "?[Press any key to exit]"
				exit 1
			}
	}

	. -- "$plugin/$2"
}

alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ls="ls --color=auto -thA"
alias ll="ls -lr"
alias hx="helix"
alias open="xdg-open"

stty -ixon
bindkey -e

setopt incappendhistory
setopt histignorespace
setopt histignorealldups
HISTSIZE=100
SAVEHIST=65535
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

PROMPT="\$timeprompt%F{%(?:2:1)}➜%f%(?:: %B%F{1}%?%f%b) %B%F{6}%c%f%b\$(gitprompt) "
PROMPT_EOL_MARK="%F{8}%f"
ZSH_GIT_PROMPT_SHOW_STASH=1
ZSH_GIT_PROMPT_SHOW_TRACKING_COUNTS=0
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
timeprompt-preexec-hook() {
	unset timeprompt
	timeprompt_start="$(($(date +%s%N) / 1000000))"
}
timeprompt-precmd-hook() {
	if [ "$timeprompt_start" ]; then
		timeprompt_end="$(($(date +%s%N) / 1000000))"
		timeprompt_took="$(($timeprompt_end - $timeprompt_start))"
		if [ "$timeprompt_took" -ge 1000 ]; then
			timeprompt="$(printf '%%F{8}%.2fs%%f ' "$(printf '%d / 1000\n' "$timeprompt_took" | bc -l)")"
		fi
		unset timeprompt_took timeprompt_end timeprompt_start
	fi
}
preexec_functions+=(timeprompt-preexec-hook)
precmd_functions+=(timeprompt-precmd-hook)
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
use woefe/git-prompt.zsh git-prompt.plugin.zsh
