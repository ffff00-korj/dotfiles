local opts = {
  "cursortab/cursortab.nvim",
  version = "v0.8.0",
  lazy = false,
  build = "cd server && go build",
  config = function()
    require("cursortab").setup({
      provider = {
        type = "mercuryapi",
        api_key_env = "AUTOCOMPLETE_AI_TOKEN",
      },
    })
  end,
}

return opts
