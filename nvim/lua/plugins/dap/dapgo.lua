local opts = {
  "leoluz/nvim-dap-go",
  config = function()
    require("dap-go").setup({
      delve = {
        path = "dlv",
        build_flags = "",
      },
    })

    local get_arguments = function()
      local args_str = vim.fn.input("Arguments: ")
      return vim.split(args_str, " ")
    end

    local get_build_flags = function()
      local flags_str = vim.fn.input("Build flags: ")
      return vim.split(flags_str, " ")
    end

    local filtered_pick_process = function()
      return require("dap.utils").pick_process({
        filter = function(proc)
          return proc.name:match("go") or proc.name:match("dlv")
        end,
      })
    end

    require("dap").configurations.go = {
      {
        type = "go",
        name = "Package",
        request = "launch",
        program = "${fileDirname}",
      },
      {
        type = "go",
        name = "Attach",
        mode = "local",
        request = "attach",
        processId = filtered_pick_process,
      },
      {
        type = "go",
        name = "Test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
      },
    }
  end,
}

return opts
