return {
  {
    "cursortab/cursortab.nvim",
    version = "v0.8.0",
    lazy = false,
    build = "cd server && go build",
    config = function()
      require("cursortab").setup({
        keymaps = {
          accept = "<M-Tab>",
          partial_accept = false,
        },
        ui = {
          jump = {
            symbol = "", -- Symbol shown for jump points
            text = " <M-Tab> ", -- Text displayed after jump symbol
            show_distance = true, -- Show line distance for off-screen jumps
          },
        },
        provider = {
          -- cloud AI model https://platform.inceptionlabs.ai/
          -- type = "mercuryapi",
          -- api_key_env = "AUTOCOMPLETE_AI_TOKEN",

          -- install llama-server
          -- brew install llama.cpp
          -- install any model: faster -> slower
          -- llama-server -hf sweepai/sweep-next-edit-0.5B --port 8000
          -- llama-server -hf sweepai/sweep-next-edit-1.5B --port 8000
          -- llama-server -hf sweepai/sweep-next-edit-v2-7B --port 8000
          type = "sweep",
          url = "http://localhost:8000",
        },
      })
    end,
  },
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    config = function()
      vim.o.autoread = true

      vim.keymap.set({ "n", "x" }, "<leader>oa", function()
        require("opencode").ask("@this: ")
      end, { desc = "Ask OpenCode…" })
      vim.keymap.set({ "n", "x" }, "<leader>os", function()
        require("opencode").select()
      end, { desc = "Select OpenCode…" })

      vim.keymap.set({ "n", "x" }, "go", function()
        return require("opencode").operator("@this ")
      end, { desc = "Append range to OpenCode", expr = true })
      vim.keymap.set("n", "goo", function()
        return require("opencode").operator("@this ") .. "_"
      end, { desc = "Append line to OpenCode", expr = true })

      vim.keymap.set("n", "<S-C-u>", function()
        require("opencode").command("session.half.page.up")
      end, { desc = "Scroll OpenCode up" })
      vim.keymap.set("n", "<S-C-d>", function()
        require("opencode").command("session.half.page.down")
      end, { desc = "Scroll OpenCode down" })
    end,
  },
}
