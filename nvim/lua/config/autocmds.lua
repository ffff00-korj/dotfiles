vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Keymaps for Lsp",
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
    map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    map("gt", vim.lsp.buf.type_definition, "[G]oto [T]ype definition")
    map("ca", vim.lsp.buf.code_action, "Show [c]ode [a]ctions")
    map("<F2>", vim.lsp.buf.rename, "[R]e[n]ame")
    map(
      "<leader>ht",
      (function(config)
        local default, active = vim.diagnostic.config(), false
        return function()
          vim.diagnostic.config(active and default or config)
          active = not active
        end
      end)({ virtual_text = false, virtual_lines = { current_line = true } }),
      "[H]int [T]oggle"
    )
  end,
})
