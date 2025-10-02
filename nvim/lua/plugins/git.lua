local opts = {
  {
    "tpope/vim-fugitive",
    keys = { { "<leader>gs", vim.cmd.Git, { desc = "Figitive: [g]it [s]tatus" } } },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          vim.keymap.set(
            "n",
            "<leader>hp",
            gs.preview_hunk_inline,
            { buffer = bufnr, desc = "Gitsigns: [h]unk [p]review inline" }
          )
          vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Gitsigns: [h]unk [r]eset" })
        end,
      })
    end,
  },
}

return opts
