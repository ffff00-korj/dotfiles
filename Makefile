all:
	make install-zsh
	make install-tmux
	make install-alacritty
	make install-neovim

install-zsh:
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	cp ./zsh/zshrc ~/.zshrc

install-tmux:
	cp ./tmux/tmux.conf ~/.tmux.conf
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	tmux source ~/.tmux.conf

install-alacritty:
	mkdir -p ~/.config/alacritty/themes
	git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
	cp ./alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

install-gdb:
	cp ./gdb/gdbinit ~/.gdbinit

install-neovim:
	sudo pacman -S fd
	git clone git@github.com:ffff00-korj/nvim_config.git ~/.config/nvim
