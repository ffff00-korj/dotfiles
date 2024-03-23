all:
	make install-zsh
	make install-tmux
	make install-alacritty

install-zsh:
	cp ./zsh/zshrc ~/.zshrc

install-tmux:
	cp ./tmux/tmux.conf ~/.tmux.conf

install-alacritty:
	mkdir -p ~/.config/alacritty/themes
	git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
	cp ./alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

install-gdb:
	cp ./gdb/gdbinit ~/.gdbinit
