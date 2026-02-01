.PHONY: font
font:
	@if ! brew list --cask font-jetbrains-mono-nerd-font >/dev/null 2>&1; then \
		echo "Installing JetBrains Mono Nerd Font..."; \
		brew install --cask font-jetbrains-mono-nerd-font; \
	else \
		echo "Warning: JetBrains Mono Nerd Font is already installed"; \
	fi

.PHONY: alacritty
alacritty:
	@if ! brew list --cask alacritty >/dev/null 2>&1; then \
		echo "Installing Alacritty..."; \
		brew install --cask alacritty; \
	else \
		echo "Warning: Alacritty is already installed"; \
	fi
	
	@mkdir -p ~/.config/alacritty
	@if [ -d ./alacritty ]; then \
		cp -r ./alacritty/* ~/.config/alacritty/; \
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
			echo "Warning: $$pkg is already installed"; \
		fi \
	done

	@if [ -f ./tmux/tmux.conf ]; then \
		cp ./tmux/tmux.conf ~/.tmux.conf; \
	else \
		echo "Warning: tmux.conf not found"; \
	fi

	@if [ ! -d ~/.tmux/plugins/tpm ]; then \
		echo "Installing TPM..."; \
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; \
	else \
		echo "Warning: TPM is already installed"; \
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
	else \
		echo "Warning: '~/.zsh/zsh-autosuggestions already exists'"; \
	fi

	@if [ -d ./zsh ]; then \
		cp ./zsh/zshrc ~/.zshrc; \
		echo "Please run 'source ~/.zshrc' or restart your terminal"; \
	else \
		echo "Warning: .zshrc not found"; \
	fi

.PHONY: neovim
neovim:
	@for pkg in neovim fd ripgrep rust node; do \
		if ! brew list $$pkg >/dev/null 2>&1; then \
			echo "Installing $$pkg..."; \
			brew install $$pkg; \
		else \
			echo "Warning: $$pkg is already installed"; \
		fi \
	done

	@if [ -d ./nvim ]; then \
		mkdir -p ~/.config/nvim; \
		rsync -a --delete ./nvim/ ~/.config/nvim/; \
	else \
		echo "Warning: nvim directory not found"; \
	fi

.PHONY: brew
brew:
	@/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

.PHONY: ai-tools
ai-tools:
	@for pkg in codex aichat; do \
		if ! brew list $$pkg >/dev/null 2>&1; then \
			echo "Installing $$pkg..."; \
			brew install $$pkg; \
		else \
			echo "Warning: $$pkg is already installed"; \
		fi \
	done

.PHONY: tiling
tiling:
	@for pkg in koekeishiya/formulae/yabai koekeishiya/formulae/skhd; do \
		if ! brew list $$pkg >/dev/null 2>&1; then \
			echo "Installing $$pkg..."; \
			brew install $$pkg; \
		else \
			echo "Warning: $$pkg is already installed"; \
		fi \
	done

	@mkdir -p ~/.config/yabai
	@mkdir -p ~/.config/skhd

	@cp ./tiling/yabairc ~/.config/yabai/yabairc
	@cp ./tiling/skhdrc ~/.config/skhd/skhdrc

	@yabai --uninstall-service
	@yabai --install-service
	@yabai --start-service

	@skhd --uninstall-service
	@skhd --install-service
	@skhd --start-service

.PHONY: all
all:
	@echo "Starting setup process..."
	@make brew
	@make font
	@make alacritty
	@make neovim
	@make tmux
	@make zsh
	@make ai-tools
	@make tiling
	@echo "Setup completed successfully! 🎉"
