if [ "$(tty)" = /dev/tty1 ] && [ -z "$WAYLAND_DISPLAY" ]
then
	exec sway >> "$XDG_STATE_HOME/sway.log" 2>&1
fi
