local opts = {
  "igorlfs/nvim-dap-view",
  opts = {},
  config = function()
    vim.keymap.set("n", "<leader>Du", "<cmd>DapViewToggle<cr>", { desc = "DAP: ui toggle" })
  end,
}

return opts
