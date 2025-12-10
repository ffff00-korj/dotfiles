local opts = {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "gopls",
          "delve",
          "golangci-lint-langserver",

          "stylua",
          "buf",
          "lua-language-server",
        },
      })
    end,
  },
}

return opts
