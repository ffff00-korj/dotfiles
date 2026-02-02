local opts = {
  "igorlfs/nvim-dap-view",
  config = function()
    local dap = require("dap")
    local dapui = require("dap-view")
    dapui.setup({
      winbar = {
        sections = { "watches", "scopes", "breakpoints", "threads", "repl" },
        default_section = "scopes",
      },
    })
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<leader>Du", "<cmd>DapViewToggle<cr>", { desc = "DAP: ui toggle" })
  end,
}

return opts
