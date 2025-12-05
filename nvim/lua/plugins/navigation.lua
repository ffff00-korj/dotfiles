local opts = {
  {
    "mbbill/undotree",
    event = "VeryLazy",
    keys = { { "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree: [u]ndo tree toggle" } } },
  },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    cmd = "Trouble",
    opts = { signs = { error = "E", warning = "W", hint = "H", information = "I" } },
    keys = { { "<leader>pt", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>", { desc = "Trouble: [p]rocess [t]roubles" } } },
  },
  {
    "theprimeagen/harpoon",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon: [a]dd current file into harpoon" })
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon: open harpoon quick menu" })

      vim.keymap.set("n", "<A-1>", function()
        ui.nav_file(1)
      end, { desc = "Harpoon: open file 1" })
      vim.keymap.set("n", "<A-2>", function()
        ui.nav_file(2)
      end, { desc = "Harpoon: open file 2" })
      vim.keymap.set("n", "<A-3>", function()
        ui.nav_file(3)
      end, { desc = "Harpoon: open file 3" })
      vim.keymap.set("n", "<A-4>", function()
        ui.nav_file(4)
      end, { desc = "Harpoon: open file 4" })
      vim.keymap.set("n", "<A-5>", function()
        ui.nav_file(5)
      end, { desc = "Harpoon: open file 5" })
    end,
  },
}

return opts
