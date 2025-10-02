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
          "stylua",
          "buf",
          "lua-language-server",
          "bash-language-server",
        },
      })
    end,
  },
}

return opts
