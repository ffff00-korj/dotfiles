return {
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
    local function get_nearest_test_name()
      local node = vim.treesitter.get_node()
      while node do
        local type = node:type()
        if type == "function_declaration" or type == "method_declaration" then
          local name_nodes = node:field("name")
          if name_nodes and #name_nodes > 0 then
            local name_node = name_nodes[1]
            local name = vim.treesitter.get_node_text(name_node, 0)
            if name:match("^Test") then
              return name
            end
          end
        end
        node = node:parent()
      end
      return nil
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
        name = "Nearest Test",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
        args = function()
          local test_name = get_nearest_test_name()
          if test_name == "" then
            vim.notify("No test found under cursor!", vim.log.levels.ERROR)
            return nil
          end
          return { "-test.run", "^" .. test_name .. "$" }
        end,
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
