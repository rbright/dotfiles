$env.config.plugins = {}

# Stop inactive plugins
$env.config.plugin_gc.default.enabled = true

# How long to wait after plugin is inactive before stopping it
$env.config.plugin_gc.default.stop_after = 10sec

# Alternate garbage collection configuration per-plugin.
$env.config.plugin_gc.plugins = {}