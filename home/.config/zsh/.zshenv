if [ -d /usr/local/go/bin ] && [ -d "$HOME/go/bin" ]; then
	export PATH="$HOME/go/bin:/usr/local/go/bin:$PATH"
fi

if [ -d "$XDG_DATA_HOME/pnpm" ]; then
	export PATH="$XDG_DATA_HOME/pnpm:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ]; then
	export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -f ~/.local/share/vulkansdk/default/setup-env.sh ]; then
	source ~/.local/share/vulkansdk/default/setup-env.sh
fi
