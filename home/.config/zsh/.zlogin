if [ "$(tty)" = /dev/tty1 ] && [ -z "$TMUX" ]; then
	exec sway 2>> "$XDG_STATE_HOME/sway.log"
fi
