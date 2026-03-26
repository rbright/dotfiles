require("snacks").setup({
  bigfile = { enabled = true },
  explorer = {
    enabled = true,
    replace_netrw = true,
  },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = {
    enabled = true,
    timeout = 8000,
  },
  picker = {
    enabled = true,
    layout = {
      preset = "vscode",
    },
    sources = {
      files = {
        hidden = true,
        ignored = true,
      },
      grep = {
        hidden = true,
        ignored = true,
      },
      explorer = {
        auto_close = true,
        follow_file = true,
        layout = {
          preset = "sidebar",
          preview = false,
        },
      },
      lsp_symbols = {
        layout = {
          preset = "right",
        },
      },
      git_status = {
        layout = {
          preset = "right",
        },
      },
    },
  },
  quickfile = { enabled = true },
  rename = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = false },
  terminal = {
    enabled = true,
    win = {
      position = "bottom",
      height = 0.35,
    },
  },
  words = { enabled = true },
})
