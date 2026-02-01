local opts = {
  "theHamsta/nvim-dap-virtual-text",
  config = function()
    require("nvim-dap-virtual-text").setup({
      enabled = false,
    })
    vim.keymap.set("n", "<leader>Dvt", "<cmd>DapVirtualTextToggle<cr>", { desc = "DAP: toggle virtual text" })
  end,
}

return opts
