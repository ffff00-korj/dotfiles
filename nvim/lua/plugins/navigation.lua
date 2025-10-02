local opts = {
  {
    "mbbill/undotree",
    event = "VeryLazy",
    keys = { { "<leader>u", vim.cmd.UndotreeToggle, { desc = "[u]ndo tree toggle" } } },
  },
  {
    "theprimeagen/harpoon",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "[a]dd current file into harpoon" })
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "open harpoon quick menu" })

      vim.keymap.set("n", "<A-1>", function()
        ui.nav_file(1)
      end, { desc = "open file 1" })
      vim.keymap.set("n", "<A-2>", function()
        ui.nav_file(2)
      end, { desc = "open file 2" })
      vim.keymap.set("n", "<A-3>", function()
        ui.nav_file(3)
      end, { desc = "open file 3" })
      vim.keymap.set("n", "<A-4>", function()
        ui.nav_file(4)
      end, { desc = "open file 4" })
      vim.keymap.set("n", "<A-5>", function()
        ui.nav_file(5)
      end, { desc = "open file 5" })
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {
      signs = {
        error = "E",
        warning = "W",
        hint = "H",
        information = "I",
      },
    },
    keys = {
      { "<leader>pt", "<cmd>Trouble diagnostics toggle focus=true<cr>", { desc = "[p]rocess [t]roubles" } },
    },
  },
}

return opts
