local opts = {
  "folke/persistence.nvim",
  lazy = false,
  keys = {
    {
      "<leader>qd",
      function()
        require("persistence").stop()
        vim.cmd("qa")
      end,
      desc = "Delete current session and quit",
    },
  },
  opts = {
    need = 0,
  },
  config = function(_, opts)
    local persistence = require("persistence")
    persistence.setup(opts)

    vim.api.nvim_create_autocmd("VimLeavePre", {
      group = vim.api.nvim_create_augroup("PersistenceAutoSave", { clear = true }),
      callback = function()
        persistence.save()
      end,
    })
  end,
}

return opts
