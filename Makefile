.PHONY: tmux devcontainer startup

script:
	@mkdir -p ~/.local/bin
	@cp project.sh ~/.local/bin/project

tmux:
	@cp ./tmux/tmux.conf ~/.tmux.conf
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	@brew install sesh zoxide fzf
	@tmux source ~/.tmux.conf

devcontainer:
	@brew install npm
	@npm install -g @devcontainers/cli
	@cp -r ./devcontainer/ ~/.devcontainer

startup:
	@make tmux
	@make devcontainer
	@make script
	
