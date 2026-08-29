return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- Language Adapters (Install the ones you need)
      "nvim-neotest/neotest-go",
    },
    config = function()
      local neotest = require("neotest")

      neotest.setup({
        adapters = {
          require("neotest-go")({
            dap_go_enabled = true,
          }),
        },
        status = { virtual_text = true },
        output = { open_on_run = true },
      })

      -- Keymaps
      local keymap = vim.keymap.set

      -- Run tests
      keymap("n", "<leader>tr", function()
        neotest.run.run()
      end, { desc = "Run Nearest Test" })
      keymap("n", "<leader>tR", function()
        neotest.run.run({ strategy = "dap" })
      end, { desc = "Run Nearest Test (debug mod)" })
      keymap("n", "<leader>tf", function()
        neotest.run.run(vim.fn.expand("%"))
      end, { desc = "Run Current File" })
      keymap("n", "<leader>ts", function()
        neotest.run.stop()
      end, { desc = "Stop Test" })

      -- UI toggles
      keymap("n", "<leader>to", function()
        neotest.output.open({ enter = true })
      end, { desc = "Show Test Output" })
      keymap("n", "<leader>tp", function()
        neotest.summary.toggle()
      end, { desc = "Toggle Test Summary Panel" })
    end,
  },
}
