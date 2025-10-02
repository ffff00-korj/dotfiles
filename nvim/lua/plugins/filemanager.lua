local opts = {
  "stevearc/oil.nvim",
  lazy = false,
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Oil: Open parent directory" },
  },
  config = function()
    CustomOilBar = function()
      local path = vim.fn.expand("%")
      path = path:gsub("oil://", "")

      return "  " .. vim.fn.fnamemodify(path, ":.")
    end

    require("oil").setup({
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-k>"] = false,
        ["<C-j>"] = false,
        ["<M-h>"] = "actions.select_split",
      },
      win_options = { winbar = "%{v:lua.CustomOilBar()}" },
      view_options = { show_hidden = true },
    })
  end,
}

return opts
