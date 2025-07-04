# Neovim Config

Моя персональная конфигурация для [Neovim](https://neovim.io), ориентированная на продуктивную разработку с акцентом на удобство, скорость и расширяемость.

## 📦 Особенности

- 🚀 **Lazy.nvim** — современный, быстрый и асинхронный менеджер плагинов.
- 🧠 **Поддержка языков программирования**:
  - Python 🐍
  - Go 🐹
  - Lua 🌙
  - Bash 🖥️
- 🗂 **Oil.nvim** — продвинутый файловый менеджер в стиле интерфейса Neovim.
- 🧪 **DAP (nvim-dap)** — встроенный отладчик с адаптерами для популярных языков.
- 🔍 **Telescope.nvim** — мощный fuzzy finder для файлов, буферов, LSP, Git и многого другого.
- 🔗 **Harpoon** — быстрый доступ к часто используемым файлам и буферам.
- 🧰 **Интеграция с Git**:
  - Просмотр диффов и истории (`gitsigns`, `telescope`).
  - Удобные команды для Git прямо из Neovim.
- ✨ Эстетичный и минималистичный интерфейс с поддержкой тем и кастомизации.
- 🛠️ Продвинутая настройка LSP, автодополнения и форматирования.
- 🤖 Автокомплит и промпты с помощью AI (Ollama).

## ⚙️ Использование внутри DevContainer

Конфигурация предназначена для запуска внутри **DevContainer**.

> ❗ **Важно:** если Вы запускаете Neovim **вне** DevContainer, убедитесь, что изменили адрес хоста в файле:
>
> ```
> nvim/lua/plugins/ai.lua
> ```
>
> по умолчанию используется Docker-хост (например, `host.docker.internal`), замените его на `localhost`, чтобы избежать ошибок подключения к локальному AI-серверу или сервису.

## 📁 Установка

1. Убедитесь, что установлен Neovim `>= 0.9`.
2. Клонируйте репозиторий:

```bash
git clone https://github.com/ffff00-korj/dotfiles.git
mkdir -p ~/.config
cp -r dotfiles/nvim ~/.config
```

3. Запустите Neovim — плагины будут установлены автоматически благодаря `lazy.nvim`.

## 🧪 Зависимости

- `neovim` (v0.9+)
- `git`
- `node` и `npm` (для JavaScript и некоторых LSP)
- `go` (для Go)
- `python3` и `pip`
- **Обязательно** установить `fd` — для корректной работы `telescope`.
