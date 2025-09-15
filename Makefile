.PHONY: font autodev alacritty tmux devcontainer startup neovim

font:
	@brew install --cask font-jetbrains-mono-nerd-font

autodev:
	@mkdir -p ~/.local/bin
	@cp autodev.sh ~/.local/bin/autodev

alacritty:
	@brew install --cask alacritty
	@mkdir -p ~/.config/alacritty
	@cp alacritty/* ~/.config/alacritty/

tmux:
	@brew install tmux sesh zoxide fzf
	@cp ./tmux/tmux.conf ~/.tmux.conf
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	@tmux source ~/.tmux.conf

devcontainer:
	@brew install npm
	@npm install -g @devcontainers/cli
	@cp -r ./devcontainer/ ~/.devcontainer
	@echo "OPENROUTER_API_KEY=your_api_key" > ~/.devcontainer/.env

startup:
	@make font
	@make alacritty
	@make neovim
	@make tmux
	@make devcontainer
	@make autodev
	
neovim:
	@brew install fd goenv
	@goenv install 1.24.7 && goenv global 1.24.7
	@mkdir -p ~/.config
	@rm -rf ~/.config/nvim
	@cp -r ./nvim ~/.config

