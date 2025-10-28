printf 'Would you like to launch Sway? [Y/n] '
read -r yn
if [ "$yn" = '' ] || [ "$yn" = Y ] || [ "$yn" = y ]; then
	sway
fi
