.PHONY: all install uninstall sync

all:

install:
	stow -Rt ~ home

uninstall:
	stow -Dt ~ home

sync:
	git add -A
	git commit -m "Synchronize using make"
	git pull -r
	git push
