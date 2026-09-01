local opts = {
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
}

return opts
