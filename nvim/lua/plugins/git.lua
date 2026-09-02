return {
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gs", vim.cmd.Git, { desc = "Figitive: [g]it [s]tatus" } },
      { "<leader>gP", "<cmd>Git push<cr>", { desc = "Figitive: [g]it [p]ush" } },
      { "<leader>gp", "<cmd>Git pull<cr>", { desc = "Figitive: [g]it [p]ull" } },
      { "<leader>gm", "<cmd>Gdiffsplit master<cr>", { desc = "Diffview: view diff current branch with master" } },
      { "<leader>gM", "<cmd>Gdiffsplit main<cr>", { desc = "Diffview: view diff current branch with main" } },
    },
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
          vim.keymap.set("n", "<leader>br", gs.reset_buffer, { buffer = bufnr, desc = "Gitsigns: [b]uffer[r]eset" })
        end,
      })
    end,
  },
}
