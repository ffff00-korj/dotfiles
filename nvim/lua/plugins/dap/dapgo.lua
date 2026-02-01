local opts = {
  "leoluz/nvim-dap-go",
  config = function()
    require("dap-go").setup({
      delve = {
        path = "dlv",
        build_flags = "",
      },
    })

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
        name = "Test",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
      },
      {
        type = "go",
        name = "Attach",
        mode = "local",
        request = "attach",
        processId = filtered_pick_process,
      },
    }
  end,
}

return opts
