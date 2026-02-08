local wezterm = require("wezterm")

local config = wezterm.config_builder and wezterm.config_builder() or {}
local home = os.getenv("HOME") or "/Users/rbright"
local nu_bin = home .. "/.nix-profile/bin/nu"

local function file_exists(path)
  local file = io.open(path, "r")

  if file then
    file:close()
    return true
  end

  return false
end

if file_exists(nu_bin) then
  config.default_prog = { nu_bin }
else
  config.default_prog = { "/bin/zsh", "-l" }
end

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font_with_fallback({
  "JetBrainsMono Nerd Font Mono",
  "JetBrains Mono",
})
config.font_size = 14.0
config.harfbuzz_features = { "ss01", "ss05", "dlig" }
config.default_cursor_style = "BlinkingBlock"
config.hide_mouse_cursor_when_typing = true
config.scrollback_lines = 50000
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"

return config
