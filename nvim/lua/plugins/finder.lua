local opts = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = vim.tbl_extend("force", require("telescope.themes").get_ivy(), {
        file_ignore_patterns = {
          "%.git/",
          "%.trash/",
        },
        mappings = {
          n = {
            ["q"] = actions.close,
          },
        },
      }),

      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
        },
      },

      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    telescope.load_extension("fzf")
    vim.keymap.set(
      "n",
      "<leader><leader>",
      "<cmd>Telescope buffers<cr>",
      { desc = "Telescope: Current opened buffers" }
    )
    vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope: Find files (including hidden)" })
    vim.keymap.set("n", "<leader>ps", function()
      builtin.live_grep({
        additional_args = function()
          return { "--hidden" }
        end,
      })
    end, { desc = "Telescope: Live grep (including hidden)" })
  end,
}

return opts
