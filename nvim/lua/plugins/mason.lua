local opts = {
  "williamboman/mason.nvim",
  dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  cmd = "Mason",
  config = function()
    require("mason").setup()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "ruff",
        "gopls",
        "delve",
        "stylua",
        "checkmake",
        "buf",
        "lua-language-server",
        "bash-language-server",
      },
    })
  end,
}

return opts
