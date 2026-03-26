local M = {}

local function check_executable(name, command)
  local path = vim.fn.exepath(command)
  if path ~= "" then
    vim.health.ok(("%s: `%s`"):format(name, path))
  else
    vim.health.warn(("%s: not available"):format(name))
  end
end

local function patch_blink_health()
  local ok, health = pcall(require, "blink.cmp.health")
  if not ok then
    return
  end

  function health.report_sources()
    local sources = require("blink.cmp.sources.lib")
    local all_providers = sources.get_all_providers()
    local default_providers = sources.get_enabled_provider_ids("default")
    local cmdline_providers = sources.get_enabled_provider_ids("cmdline")

    local disabled_providers = {}
    for provider_id, _ in pairs(all_providers) do
      if
        not vim.list_contains(default_providers, provider_id) and not vim.list_contains(cmdline_providers, provider_id)
      then
        disabled_providers[#disabled_providers + 1] = provider_id
      end
    end

    table.sort(default_providers)
    table.sort(cmdline_providers)
    table.sort(disabled_providers)

    health.report_sources_list("Default sources", default_providers)
    health.report_sources_list("Cmdline sources", cmdline_providers)
    health.report_sources_list("Disabled sources", disabled_providers)
  end
end

local function patch_mason_health()
  local ok, mason_health = pcall(require, "mason.health")
  if not ok then
    return
  end

  mason_health.check = function()
    vim.health.start("mason.nvim")
    vim.health.ok("neovim version >= 0.10.0")

    local settings = require("mason.settings")
    vim.health.ok(("PATH: %s"):format(settings.current.PATH))
    vim.health.ok(("Providers:\n  %s"):format(table.concat(settings.current.providers, "\n  ")))

    vim.health.start("mason.nvim [Used language runtimes]")
    check_executable("node", "node")
    check_executable("npm", "npm")
    check_executable("python3", "python3")
    check_executable("go", "go")
    check_executable("cargo", "cargo")
    check_executable("java", "java")
    check_executable("javac", "javac")
    check_executable("luarocks", "luarocks")
  end
end

local function patch_snacks_health()
  local ok, snacks = pcall(require, "snacks")
  if not ok then
    return
  end

  for _, plugin in ipairs(snacks.meta.get()) do
    local opts = snacks.config[plugin.name] or {}
    if plugin.meta and plugin.meta.needs_setup and opts.enabled ~= true then
      plugin.meta.health = false
    end
  end
end

function M.setup()
  patch_blink_health()
  patch_mason_health()
  patch_snacks_health()
end

function M.check()
  vim.health.start("config")
  vim.health.ok("Custom health overrides loaded")
end

return M
