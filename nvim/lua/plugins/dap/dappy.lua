local opts = {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  config = function()
    require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    table.insert(require("dap").configurations.python, {
      type = "python",
      name = "attach to debugpy",
      request = "attach",
      connect = {
        host = "127.0.0.1",
        port = 5678,
      },
      pathMappings = {
        {
          localRoot = vim.fn.getcwd(),
          remoteRoot = "/app",
        },
      },
    })
  end,
}

return opts
