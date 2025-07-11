local opts = {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  cmd = "Mason",
  config = function()
    require("mason").setup()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "pyright",
        "debugpy",
        "ruff",
        "gopls",
        "delve",
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "bash-language-server",
      },
    })
  end,
}

return opts
