local opts = {
  "saghen/blink.cmp",
  dependencies = "L3MON4D3/LuaSnip",
  version = "v0.*",
  opts = {
    keymap = {
      preset = "super-tab",
      ["<C-n>"] = { "scroll_documentation_down" },
      ["<C-p>"] = { "scroll_documentation_up" },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    signature = { enabled = true },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        sql = { "snippets", "dadbod", "buffer" },
      },
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
      },
    },
  },
}

return opts
