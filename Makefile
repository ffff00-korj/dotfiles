install-zsh:
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	cp ./zsh/zshrc ~/.zshrc

install-tmux:
	cp ./tmux/tmux.conf ~/.tmux.conf
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	brew install sesh zoxide fzf
	tmux source ~/.tmux.conf

install-neovim:
	brew install neovim fd npm go
	mkdir -p ~/.local/bin/
	ln -s /opt/homebrew/bin/nvim ~/.local/bin/v
	git clone git@github.com:ffff00-korj/nvim_config.git ~/.config/nvim

install-ghostty:
	brew install ghostty
	mkdir -p ~/.config/ghostty
	cp ./ghostty/config ~/.config/ghostty/config
