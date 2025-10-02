local opts = {
  {
    "tpope/vim-fugitive",
    keys = { { "<leader>gs", vim.cmd.Git, { desc = "[g]it [s]tatus" } } },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
          map("n", "<leader>hp", gs.preview_hunk_inline, { desc = "[h]unk [p]review inline" })
          map("n", "<leader>hr", gs.reset_hunk, { desc = "[h]unk [r]eset" })
        end,
      })
    end,
  },
}

return opts
