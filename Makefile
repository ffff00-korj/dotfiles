all:
	make install-zsh
	make install-tmux
	make install-alacritty

install-zsh:
	cp ./zsh/zshrc ~/.zshrc

install-tmux:
	cp ./tmux/tmux.conf ~/.tmux.conf

install-alacritty:
	cp ./alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

install-gdb:
	cp ./gdb/gdbinit ~/.gdbinit
