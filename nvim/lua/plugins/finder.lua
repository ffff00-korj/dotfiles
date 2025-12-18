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
          n = { ["q"] = actions.close },
        },
      }),
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

    vim.keymap.set("n", "<leader>pf", function()
      builtin.find_files({
        hidden = false,
        no_ignore = false,
      })
    end, { desc = "Telescope: Find files" })

    vim.keymap.set("n", "<leader>pF", function()
      builtin.find_files({
        hidden = true,
        no_ignore = true,
      })
    end, { desc = "Telescope: Find files (hidden)" })

    vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Telescope: Live grep" })

    vim.keymap.set("n", "<leader>pS", function()
      builtin.live_grep({
        additional_args = function()
          return { "--hidden" }
        end,
      })
    end, { desc = "Telescope: Live grep (hidden)" })
  end,
}

return opts
