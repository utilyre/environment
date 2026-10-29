# Sane Defaults: {{{
stty -ixon # free ctrl+s
bindkey -e # emacs bindings

setopt incappendhistory histignorespace histignorealldups
HISTSIZE=128
SAVEHIST=65535
HISTFILE="$XDG_STATE_HOME/zshhst"
# }}}
# Completion: {{{
setopt globcomplete globdots nolisttypes
zmodload zsh/complist
autoload compinit
compinit -d "$XDG_CACHE_HOME/zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' file-sort mtime
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' list-colors "$LS_COLORS"
# }}}
# Prompt: {{{
setopt promptsubst

PROMPT='$timeprompt%F{%(?:2:1)}➜%f%(?:: %B%F{1}%?%f%b) %B%F{6}%c%f%b '
PROMPT_EOL_MARK='%F{8}⏎%f'

# show execution time when commands takes longer than a second
timeprompt-preexec-hook() {
	unset timeprompt
	timeprompt_start="$(($(date +%s%N) / 1000000))"
}
timeprompt-precmd-hook() {
	if [ "$timeprompt_start" ]
	then
		timeprompt_end="$(($(date +%s%N) / 1000000))"
		timeprompt_took="$(($timeprompt_end - $timeprompt_start))"
		if [ "$timeprompt_took" -ge 1000 ]
		then
			timeprompt="$(printf '%%F{8}%.2fs%%f ' "$(printf '%d / 1000\n' "$timeprompt_took" | bc -l)")"
		fi
		unset timeprompt_took timeprompt_end timeprompt_start
	fi
}
preexec_functions+=(timeprompt-preexec-hook)
precmd_functions+=(timeprompt-precmd-hook)

# replace previous prompts with a dollar sign
substitute-prompt-and-accept-line() {
	prev="$PROMPT"
	PROMPT='%F{%(?:2:1)}%(!.#.$)%f '
	zle reset-prompt
	PROMPT="$prev"
	unset prev
	zle accept-line
}
zle -N substitute-prompt-and-accept-line
bindkey ^M substitute-prompt-and-accept-line
# }}}
# Aliases: {{{
alias grep='\grep --color=auto'
alias diff='\diff --color=auto'
alias ls='\ls --color=auto -ht'
alias la='\ls --color=auto -htA'
alias ll='\ls --color=auto -hl'
alias al='\ls --color=auto -hlA'
# }}}

# vim: set fdm=marker:
