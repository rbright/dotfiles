local wezterm = require("wezterm")

local config = wezterm.config_builder and wezterm.config_builder() or {}
local home = os.getenv("HOME")
if not home or home == "" then
  home = "/home/" .. (os.getenv("USER") or "rbright")
end
local is_darwin = wezterm.target_triple and wezterm.target_triple:find("darwin", 1, true) ~= nil
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

config.alternate_buffer_wheel_scroll_speed = 1
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font_with_fallback({
  "JetBrainsMono Nerd Font Mono",
  "JetBrains Mono",
})
config.font_size = 14.0
config.harfbuzz_features = { "ss01", "ss05", "dlig" }
config.default_cursor_style = "BlinkingBlock"
config.hide_mouse_cursor_when_typing = true
config.scrollback_lines = 1000000
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false
config.tab_bar_at_bottom = false
config.use_dead_keys = false
config.use_fancy_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "RESIZE"

local keys = {
  -- Preserve Meta+Enter for terminal apps instead of WezTerm's default Alt+Enter fullscreen behavior.
  { key = "Enter", mods = "ALT", action = wezterm.action.SendString("\x1b\r") },
}

if is_darwin then
  -- Force explicit macOS clipboard bindings in case defaults are shadowed.
  table.insert(keys, { key = "c", mods = "CMD", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") })
  table.insert(keys, { key = "v", mods = "CMD", action = wezterm.action.PasteFrom("Clipboard") })
  -- Match macOS-style "delete previous word" muscle memory in terminal apps.
  table.insert(keys, { key = "Backspace", mods = "CMD", action = wezterm.action.SendKey({ key = "w", mods = "CTRL" }) })
end

config.keys = keys

return config
