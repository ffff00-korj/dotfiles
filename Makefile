.PHONY: font autodev alacritty tmux devcontainer startup neovim

font:
	@if ! brew list --cask font-jetbrains-mono-nerd-font >/dev/null 2>&1; then \
		echo "Installing JetBrains Mono Nerd Font..."; \
		brew install --cask font-jetbrains-mono-nerd-font; \
	else \
		echo "JetBrains Mono Nerd Font is already installed"; \
	fi

autodev:
	@mkdir -p ~/.local/bin
	@if [ -f ~/.local/bin/autodev ]; then \
		echo "Updating autodev script..."; \
	else \
		echo "Installing autodev script..."; \
	fi
	@cp autodev.sh ~/.local/bin/autodev
	@chmod +x ~/.local/bin/autodev
	@echo "autodev script installed/updated successfully"

alacritty:
	@if ! brew list --cask alacritty >/dev/null 2>&1; then \
		echo "Installing Alacritty..."; \
		brew install --cask alacritty; \
	else \
		echo "Alacritty is already installed"; \
	fi
	
	@mkdir -p ~/.config/alacritty
	@if [ -d ./alacritty ]; then \
		cp -r ./alacritty/* ~/.config/alacritty/; \
		echo "Alacritty configuration copied successfully"; \
	else \
		echo "Warning: alacritty directory not found"; \
	fi

tmux:
	@for pkg in tmux sesh zoxide fzf; do \
		if ! brew list $$pkg >/dev/null 2>&1; then \
			echo "Installing $$pkg..."; \
			brew install $$pkg; \
		else \
			echo "$$pkg is already installed"; \
		fi \
	done

	@if [ -f ./tmux/tmux.conf ]; then \
		cp ./tmux/tmux.conf ~/.tmux.conf; \
		echo "tmux configuration copied successfully"; \
	else \
		echo "Warning: tmux.conf not found"; \
	fi

	@if [ ! -d ~/.tmux/plugins/tpm ]; then \
		echo "Installing TPM..."; \
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; \
	else \
		echo "TPM is already installed"; \
	fi

	@if command -v tmux >/dev/null 2>&1 && tmux list-sessions >/dev/null 2>&1; then \
		echo "Reloading tmux configuration..."; \
		tmux source-file ~/.tmux.conf; \
	else \
		echo "Tmux not running or no active sessions"; \
	fi

devcontainer:
	@if ! brew list npm >/dev/null 2>&1; then \
		echo "Installing npm..."; \
		brew install npm; \
	else \
		echo "npm is already installed"; \
	fi

	@if ! command -v devcontainer >/dev/null 2>&1; then \
		echo "Installing devcontainer CLI..."; \
		npm install -g @devcontainers/cli; \
	else \
		echo "devcontainer CLI is already installed"; \
	fi

	@mkdir -p ~/.devcontainer
	@if [ -d ./devcontainer ]; then \
		cp -r ./devcontainer/* ~/.devcontainer/; \
		echo "Devcontainer configuration copied successfully"; \
	else \
		echo "Warning: devcontainer directory not found"; \
	fi

	@if [ ! -f ~/.devcontainer/.env ]; then \
		echo "OPENROUTER_API_KEY=your_api_key_here" > ~/.devcontainer/.env; \
		echo "Created .env file - don't forget to add your API key!"; \
	else \
		echo ".env file already exists"; \
	fi

startup:
	@echo "Starting setup process..."
	@make font
	@make alacritty
	@make neovim
	@make tmux
	@make devcontainer
	@make autodev
	@echo "Setup completed successfully! 🎉"
	
neovim:
	@if ! brew list fd >/dev/null 2>&1; then \
		echo "Installing fd..."; \
		brew install fd; \
	else \
		echo "fd is already installed"; \
	fi

	@if ! brew list rust >/dev/null 2>&1; then \
		echo "Installing rust..."; \
		brew install rust; \
	else \
		echo "rust is already installed"; \
	fi

	@if ! brew list goenv >/dev/null 2>&1; then \
		echo "Installing goenv..."; \
		brew install goenv; \
	else \
		echo "goenv is already installed"; \
	fi

	@if ! goenv versions | grep -q "1.24.7"; then \
		echo "Installing Go 1.24.7..."; \
		goenv install 1.24.7; \
	else \
		echo "Go 1.24.7 is already installed"; \
	fi
	
	@goenv global 1.24.7

	@mkdir -p ~/.config
	@if [ -d ./nvim ]; then \
		rm -rf ~/.config/nvim; \
		cp -r ./nvim ~/.config; \
		echo "Neovim configuration copied successfully"; \
	else \
		echo "Warning: nvim directory not found"; \
	fi

check:
	@echo "Checking installed packages..."
	@for pkg in fd goenv alacritty tmux sesh zoxide fzf npm; do \
		if brew list $$pkg >/dev/null 2>&1; then \
			echo "✅ $$pkg"; \
		else \
			echo "❌ $$pkg"; \
		fi \
	done
	@if brew list --cask font-jetbrains-mono-nerd-font >/dev/null 2>&1; then \
		echo "✅ font-jetbrains-mono-nerd-font"; \
	else \
		echo "❌ font-jetbrains-mono-nerd-font"; \
	fi
	@if command -v devcontainer >/dev/null 2>&1; then \
		echo "✅ devcontainer CLI"; \
	else \
		echo "❌ devcontainer CLI"; \
	fi
	@if goenv versions | grep -q "1.24.7"; then \
		echo "✅ Go 1.24.7"; \
	else \
		echo "❌ Go 1.24.7"; \
	fi

clean:
	@echo "Removing configurations..."
	@rm -f ~/.tmux.conf
	@rm -rf ~/.tmux/plugins
	@rm -rf ~/.config/alacritty
	@rm -rf ~/.config/nvim
	@rm -rf ~/.devcontainer
	@rm -f ~/.local/bin/autodev
	@echo "Configurations removed"
