all:
	make install-zsh
	make install-tmux

install-zsh:
	cp ./zsh/zshrc ~/.zshrc

install-tmux:
	cp ./tmux/tmux.conf ~/.tmux.conf
