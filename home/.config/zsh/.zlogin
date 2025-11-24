if [ "$(tty)" = /dev/tty1 ] && [ -z "$TMUX" ]; then
	exec sway >> "$XDG_STATE_HOME/sway.log" 2>&1
fi
