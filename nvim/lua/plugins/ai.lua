local opts = {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("minuet").setup({
        virtualtext = {
          auto_trigger_ft = { "python", "lua", "golang" },
          keymap = {
            accept = "<A-a>",
            dismiss = "<A-e>",
          },
        },
        provider = "openai_compatible",
        request_timeout = 2.5,
        n_completions = 2,
        throttle = 1500,
        debounce = 600,
        provider_options = {
          openai_compatible = {
            api_key = "OPENROUTER_API_KEY",
            end_point = "https://openrouter.ai/api/v1/chat/completions",
            model = "anthropic/claude-3.5-haiku",
            name = "Openrouter",
            optional = {
              max_tokens = 56,
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
