# 🛠️ My Dotfiles

Конфигурации и скрипты, которые я использую в окружении разработки (ориентированы на macOS и Linuxbrew).

## 📦 Состав

* 📝 Neovim конфигурация
* 📟 Tmux конфигурация
* 🐚 Zsh конфигурация
* ⚡ Alacritty конфигурация
* ⚙️ Скрипты установки (поддерживаются только macOS и [Linuxbrew](https://brew.sh))

## 🚀 Как использовать

Все команды автоматизированы в `Makefile`. Доступны следующие команды:

### Полная установка всех компонентов

```bash
make all
```

Это выполнит установку и настройку всех компонентов:
- Установка шрифта JetBrains Mono
- Установка Alacritty
- Настройка Neovim (с установкой зависимостей fd, rust, postgresql)
- Настройка Tmux и дополнительных утилит
- Установка Zsh и Oh My Zsh

### Отдельные команды установки

1. **Alacritty и шрифт**
```bash
make alacritty
```
- Устанавливает Alacritty
- Копирует конфигурацию в `~/.config/alacritty`

2. **Tmux и зависимости**
```bash
make tmux
```
- Устанавливает tmux, sesh, zoxide, fzf, opencode
- Копирует конфигурацию tmux
- Устанавливает TPM (Tmux Plugin Manager)
- Копирует конфигурацию opencode

3. **Neovim и зависимости**
```bash
make neovim
```
- Устанавливает neovim, fd, ripgrep, rust, node
- Копирует конфигурацию Neovim в `~/.config/nvim`

6. **Zsh**
```bash
make zsh
```
- Устанавливает Oh My Zsh
- Копирует zsh конфигурацию

## 📝 Зависимости

* [Homebrew](https://brew.sh)
* [Alacritty](https://alacritty.org)
* [JetBrains Mono Nerd Font](https://www.jetbrains.com/lp/mono)
* tmux, zsh
* Oh My Zsh
* [OpenCode](https://opencode.ai)
