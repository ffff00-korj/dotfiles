.PHONY: tmux devcontainer startup

autodev:
	@mkdir -p ~/.local/bin
	@cp autodev.sh ~/.local/bin/autodev

ghostty:
	@brew install --cask ghostty font-jetbrains-mono-nerd-font
	@mkdir -p ~/.config/ghostty
	@cp ghostty/config ~/.config/ghostty

tmux:
	@brew install tmux sesh zoxide fzf
	@cp ./tmux/tmux.conf ~/.tmux.conf
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	@tmux source ~/.tmux.conf

devcontainer:
	@brew install npm
	@npm install -g @devcontainers/cli
	@cp -r ./devcontainer/ ~/.devcontainer

startup:
	@make tmux
	@make devcontainer
	@make autodev
	
