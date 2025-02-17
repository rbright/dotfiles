require("catppuccin").setup({
  flavour = "mocha",
  integrations = {
    blink_cmp = true,
    fzf = true,
    gitsigns = true,
    lsp_trouble = true,
    mason = true,
    mini = {
      enabled = true,
      indentscope_color = "lavender",
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
    noice = true,
    notify = true,
    snacks = true,
    treesitter = true,
    treesitter_context = true,
    which_key = true,
  }
})
