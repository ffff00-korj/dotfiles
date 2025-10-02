# 🛠️ My Dotfiles

Конфигурации и скрипты, которые я использую в окружении разработки (ориентированы на `devcontainer`, macOS и Linuxbrew).

## 📦 Состав

* 📝 Neovim конфигурация для `devcontainer`
* 📟 Tmux конфигурация
* 🐳 Devcontainer конфигурация и скрипт `autodev`
* 🐚 Zsh конфигурация для `devcontainer`
* ⚡ Alacritty конфигурация
* ⚙️ Скрипты установки (поддерживаются только macOS и [Linuxbrew](https://brew.sh))

## 🚀 Как использовать

Все команды автоматизированы в `Makefile`. Доступны следующие команды:

### Полная установка всех компонентов

```bash
make startup
```

Это выполнит установку и настройку всех компонентов:
- Установка шрифта JetBrains Mono
- Установка Alacritty
- Настройка Neovim (с установкой зависимостей fd, rust, goenv, postgresql)
- Настройка Tmux и дополнительных утилит
- Установка Zsh и Oh My Zsh
- Настройка Devcontainer
- Установка autodev скрипта

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

3. **Devcontainer**
```bash
make devcontainer
```
- Устанавливает npm
- Устанавливает devcontainer CLI
- Копирует конфигурацию в `~/.devcontainer`
- Создает `.env` файл с заглушкой API ключа

4. **Autodev скрипт**
```bash
make autodev
```
- Копирует `autodev.sh` в `~/.local/bin`

5. **Neovim и зависимости**
```bash
make neovim
```
- Устанавливает fd, rust, goenv, go, postgresql
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
* [JetBrains Mono](https://www.jetbrains.com/lp/mono)
* tmux, zsh, docker, devcontainer/cli
* Oh My Zsh

## 🔧 Использование autodev

```bash
autodev build    # Сборка образа devcontainer из ~/.devcontainer
autodev up       # Запуск devcontainer
autodev attach   # Подключение к devcontainer
autodev launch   # build + up + attach
```
