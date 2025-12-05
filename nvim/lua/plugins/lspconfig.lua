local function format()
  if vim.bo.filetype == "lua" then
    require("stylua-nvim").format_file()
  else
    vim.lsp.buf.format()
  end
end

local opts = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    "ckipp01/stylua-nvim",
    "mfussenegger/nvim-lint",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      cond = function()
        return vim.bo.filetype == "lua"
      end,
      opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
    },
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local servers = {
      lua_ls = {
        capabilities = capabilities,
        settings = { Lua = { diagnostics = { globals = { "vim" }, disable = { "missing-fields" } } } },
      },
      gopls = { capabilities = capabilities },
      golangci_lint_ls = {
        capabilities = capabilities,
        filetypes = { "go", "gomod" },
      },
      html = { capabilities = capabilities },
      buf_ls = { capabilities = capabilities },
    }
    for server_name, config in pairs(servers) do
      vim.lsp.config[server_name] = config
      vim.lsp.enable(server_name)
    end

    vim.keymap.set("n", "<F3>", format, { desc = "Format current buffer" })
  end,
}

return opts
