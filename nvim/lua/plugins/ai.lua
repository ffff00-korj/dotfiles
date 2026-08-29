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
        type = "mercuryapi",
        api_key_env = "AUTOCOMPLETE_AI_TOKEN",

        -- Zeta-2.1 (best local)
        -- llama-server -hf mradermacher/zeta-2.1-GGUF --ctx-size 16384 --port 8000
        -- type = "zeta-2.1",
        -- url = "http://localhost:8000",

        -- sweep-next-edit-0.5B/1.5B (fastest local)
        -- llama-server -hf unsloth/Qwen3.5-0.8B-GGUF:Q8_0 --port 8000
        -- type = "sweep",
        -- url = "http://localhost:8000",
      },
    })
  end,
}

return opts
