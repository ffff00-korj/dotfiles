# 🛠️ My Dotfiles

Конфигурации и скрипты, которые я использую в окружении разработки (ориентированы на `devcontainer`, macOS и Linuxbrew).

## 📦 Состав

* 📝 Neovim конфигурация для `devcontainer`
* 📟 Tmux конфигурация
* 🐳 Devcontainer конфигурация и скрипт `autodev`
* 🐚 Zsh конфигурация для `devcontainer`
* 👻 Ghostty конфигурация
* ⚙️ Скрипты установки (поддерживаются только macOS и Linuxbrew)

---

## 🚀 Как использовать

Все команды автоматизированы в `Makefile`.

### 1. Установка Ghostty и шрифта JetBrains Mono

```bash
make ghostty
```

---

### 2. Установка Tmux и зависимостей, копирование и активация конфигурации

```bash
make tmux
```

---

### 3. Установка `devcontainer/cli` и копирование конфига в `~/.devcontainer`

```bash
make devcontainer
```

---

### 4. Копирование `autodev.sh` в локальную директорию бинарников

```bash
make autodev
```

После этого Вы можете использовать скрипт `autodev` следующим образом:

```bash
autodev build    # Сборка образа devcontainer из ~/.devcontainer
autodev up       # Запуск devcontainer
autodev attach   # Подключение к devcontainer
autodev launch   # build + up + attach
```

---

## 📝 Зависимости

* [Ghostty](https://github.com/your-link)
* [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
* `tmux`, `zsh`, `brew`, `docker`, `devcontainer/cli`

---

## 📁 Структура

```plaintext
.
├── Makefile
├── autodev.sh
├── devcontainer/
├── nvim/
├── tmux.conf
├── zshrc
└── ghostty/
```

---

## 📌 Примечание

Этот репозиторий рассчитан на разработчиков, использующих **macOS** или **Linux с Homebrew**. Поддержка других систем не гарантируется.

