local opts = {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("minuet").setup({
        virtualtext = {
          auto_trigger_ft = { "python", "lua", "go" },
          keymap = {
            accept = "<A-a>",
            dismiss = "<A-e>",
          },
        },
        provider = "openai_compatible",
        request_timeout = 3,
        n_completions = 1,
        throttle = 1000,
        debounce = 400,
        provider_options = {
          openai_compatible = {
            api_key = "OPENROUTER_API_KEY",
            end_point = "https://openrouter.ai/api/v1/chat/completions",
            model = "anthropic/claude-3.5-haiku-20241022",
            name = "Openrouter",
            optional = {
              max_tokens = 200,
              top_p = 0.9,
              provider = {
                sort = "throughput",
              },
            },
          },
        },
      })
    end,
  },
}

return opts
