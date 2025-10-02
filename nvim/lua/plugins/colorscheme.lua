local opts = {
  {
    "wnkz/monoglow.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme monoglow-void")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = { "lua", "go" },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = true },
    },
  },
  {
    "echasnovski/mini.nvim",
    enabled = true,
    config = function()
      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = true })
    end,
  },
}

return opts
