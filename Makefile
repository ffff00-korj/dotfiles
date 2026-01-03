.PHONY: font
font:
	@if ! brew list --cask font-jetbrains-mono-nerd-font >/dev/null 2>&1; then \
		echo "Installing JetBrains Mono Nerd Font..."; \
		brew install --cask font-jetbrains-mono-nerd-font; \
	else \
		echo "JetBrains Mono Nerd Font is already installed"; \
	fi

.PHONY: alacritty
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

.PHONY: tmux
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

.PHONY: zsh
zsh:
	@sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; \

	@if [ ! -d ~/.zsh/zsh-autosuggestions ]; then \
		git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions; \
		echo "zsh-autosuggestions cloned into ~/.zsh/zsh-autosuggestions"; \
	else \
		echo "Warning: '~/.zsh/zsh-autosuggestions already exists'"; \
	fi

	@if [ -d ./zsh ]; then \
		cp ./zsh/zshrc ~/.zshrc; \
		echo "Please run 'source ~/.zshrc' or restart your terminal"; \
		echo "zsh configuration copied successfully"; \
	else \
		echo "Warning: .zshrc not found"; \
	fi

.PHONY: neovim
neovim:
	@if ! brew list neovim >/dev/null 2>&1; then \
		echo "Installing neovim..."; \
		brew install neovim; \
	else \
		echo "neovim is already installed"; \
	fi

	@if ! brew list fd >/dev/null 2>&1; then \
		echo "Installing fd..."; \
		brew install fd; \
	else \
		echo "fd is already installed"; \
	fi

	@if ! brew list ripgrep >/dev/null 2>&1; then \
		echo "Installing ripgrep..."; \
		brew install ripgrep; \
	else \
		echo "ripgrep is already installed"; \
	fi

	@if ! brew list rust >/dev/null 2>&1; then \
		echo "Installing rust..."; \
		brew install rust; \
	else \
		echo "rust is already installed"; \
	fi

	@if ! brew list node >/dev/null 2>&1; then \
		echo "Installing node..."; \
		brew install node; \
	else \
		echo "node is already installed"; \
	fi

	@mkdir -p ~/.config
	@if [ -d ./nvim ]; then \
		rm -rf ~/.config/nvim; \
		cp -r ./nvim ~/.config; \
		echo "Neovim configuration copied successfully"; \
	else \
		echo "Warning: nvim directory not found"; \
	fi

.PHONY: brew
brew:
	@/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

.PHONY: aitools
aitools:
	@if ! npm ls -g @openai/codex >/dev/null 2>&1; then \
		echo "Installing @openai/codex..."; \
		npm i -g @openai/codex; \
	else \
		echo "@openai/codex is already installed"; \
	fi
	@if ! brew list aichat >/dev/null 2>&1; then \
		echo "Installing aichat..."; \
		brew install aichat; \
	else \
		echo "aichat is already installed"; \
	fi

.PHONY: tiling
tiling:
	@if ! brew list koekeishiya/formulae/yabai >/dev/null 2>&1; then \
		echo "Installing koekeishiya/formulae/yabai..."; \
		brew install koekeishiya/formulae/yabai; \
	else \
		echo "koekeishiya/formulae/yabai is already installed"; \
	fi

	@if ! brew list koekeishiya/formulae/skhd >/dev/null 2>&1; then \
		echo "Installing koekeishiya/formulae/skhd..."; \
		brew install koekeishiya/formulae/skhd; \
	else \
		echo "koekeishiya/formulae/skhd is already installed"; \
	fi

	@mkdir -p ~/.config/yabai
	@mkdir -p ~/.config/skhd

	cp ./tiling/yabairc ~/.config/yabai/yabairc
	cp ./tiling/skhdrc ~/.config/skhd/skhdrc

	yabai --uninstall-service
	yabai --install-service
	yabai --start-service

	skhd --uninstall-service
	skhd --install-service
	skhd --start-service

.PHONY: all
all:
	@echo "Starting setup process..."
	@make brew
	@make font
	@make alacritty
	@make neovim
	@make tmux
	@make zsh
	@make aitools
	@make tiling
	@echo "Setup completed successfully! 🎉"
