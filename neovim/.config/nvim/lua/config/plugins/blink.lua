return {
  keymap = {
    preset = "enter",
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = {
        border = "rounded",
      },
    },
    ghost_text = {
      enabled = true,
    },
    list = {
      selection = {
        preselect = true,
        auto_insert = false,
      },
    },
  },
  signature = {
    enabled = true,
    window = {
      border = "rounded",
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
  cmdline = {
    enabled = true,
  },
}
