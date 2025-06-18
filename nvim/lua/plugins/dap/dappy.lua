local opts = {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  config = function()
    require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    require("dap").configurations.python = {
      {
        type = "python",
        name = "Launch",
        request = "launch",
        program = "${file}",
        pythonPath = function()
          return "python"
        end,
        console = "integratedTerminal",
      },
      {
        type = "python",
        name = "Attach",
        request = "attach",
        connect = {
          host = "127.0.0.1",
          port = 5678,
        },
        pathMappings = {
          {
            localRoot = "${workspaceFolder}",
            remoteRoot = "/app",
          },
        },
      },
    }
  end,
}

return opts
