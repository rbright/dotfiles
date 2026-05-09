require("conform").setup({
  -- Stay close to Zed's formatter choices:
  -- - JS/TS/JSON/TOML/Python/Go/Rust prefer language-server formatting
  -- - Nix uses nixfmt
  -- - YAML/Markdown/CSS still use prettierd
  -- - Shell uses shfmt with two-space indents
  formatters_by_ft = {
    css = { "prettierd" },
    markdown = { "prettierd" },
    nix = { "nixfmt" },
    sh = { "shfmt" },
    sql = { "sqlfluff" },
    yaml = { "prettierd" },
    zsh = { "shfmt" },
  },
  formatters = {
    shfmt = {
      prepend_args = { "--indent", "2" },
    },
  },
  format_on_save = nil,
})
