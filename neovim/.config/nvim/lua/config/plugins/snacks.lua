local Snacks = require("snacks")

local function discover_sqlite3_path()
  local candidates = {
    "/run/current-system/sw/lib/libsqlite3.so",
    "/opt/homebrew/opt/sqlite/lib/libsqlite3.dylib",
    "/usr/local/opt/sqlite/lib/libsqlite3.dylib",
    "/usr/lib/libsqlite3.dylib",
    "/usr/lib/x86_64-linux-gnu/libsqlite3.so",
    "/usr/lib/aarch64-linux-gnu/libsqlite3.so",
    "/usr/lib64/libsqlite3.so",
    "/usr/lib/libsqlite3.so",
  }

  for _, path in ipairs(candidates) do
    if vim.uv.fs_stat(path) then
      return path
    end
  end

  local nix_matches = vim.fn.glob("/nix/store/*-sqlite-*/lib/libsqlite3.so", false, true)
  if #nix_matches > 0 then
    table.sort(nix_matches)
    return nix_matches[#nix_matches]
  end
end

Snacks.setup({
  bigfile = { enabled = true },
  explorer = {
    enabled = true,
    replace_netrw = true,
    trash = false,
  },
  image = { enabled = false },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = {
    enabled = true,
    timeout = 8000,
  },
  picker = {
    enabled = true,
    ui_select = true,
    db = {
      sqlite3_path = discover_sqlite3_path(),
    },
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

Snacks.input.enable()
vim.schedule(function()
  vim.ui.select = Snacks.picker.select
end)
