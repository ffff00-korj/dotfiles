local opts = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup({
      opts = opts,
      defaults = vim.tbl_extend("force", require("telescope.themes").get_ivy(), {
        file_ignore_patterns = { ".git", ".trash" },
        mappings = { n = { ["q"] = require("telescope.actions").close } },
        extensions = { fzf = {} },
      }),
    })
    local builtin = require("telescope.builtin")
    telescope.load_extension("fzf")

    vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope buffers<cr>", { desc = "Telescope: Current opened buffers" })

    vim.keymap.set("n", "<leader>pf", function()
      builtin.find_files({ no_ignore = true })
    end, { desc = "Telescope: [p]rocess [f]iles" })
    vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Telescope: [p]rocess grep [s]tring" })
  end,
}

return opts
