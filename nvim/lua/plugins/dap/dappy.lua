local opts = {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  config = function()
    require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    local env = {
      APP_HOST = os.getenv("APP_HOST") or "localhost",
      DEBUG_PORT = tonumber(os.getenv("DEBUG_PORT")) or 5678,
      APP_FOLDER = os.getenv("APP_FOLDER") or "/app",
    }
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
          host = env.APP_HOST,
          port = env.DEBUG_PORT,
        },
        pathMappings = {
          {
            localRoot = "${workspaceFolder}",
            remoteRoot = env.APP_FOLDER,
          },
        },
        justMyCode = false,
      },
    }
  end,
}

return opts
