if [ "$(tty)" = /dev/tty1 ] && [ -z "$TMUX" ]; then
	sway
fi
