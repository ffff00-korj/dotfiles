return {
  {
    "wnkz/monoglow.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme monoglow-void")

      -- git diff colors
      local gitlab_diff_group = vim.api.nvim_create_augroup("MonoglowGitLabDiff", { clear = true })
      vim.api.nvim_create_autocmd("OptionSet", {
        group = gitlab_diff_group,
        pattern = "diff",
        callback = function()
          if vim.v.option_new == "true" or vim.v.option_new == true then
            vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#263528", fg = "NONE" })
            vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#3c2323", fg = "#555555" })
            vim.api.nvim_set_hl(0, "DiffChange", { bg = "#203045", fg = "NONE" })
            vim.api.nvim_set_hl(0, "DiffText", { bg = "#2f4f75", fg = "NONE" })
          end
        end,
      })
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
    "ffff00-korj/tl-nvim",
    config = function()
      require("tl-nvim").setup()
    end,
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
