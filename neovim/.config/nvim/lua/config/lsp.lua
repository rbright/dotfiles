local M = {}

local uv = vim.uv or vim.loop

local function has(bin)
  return vim.fn.exepath(bin) ~= ""
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")
if ok then
  capabilities = blink.get_lsp_capabilities(capabilities)
end

local function with_capabilities(config)
  return vim.tbl_deep_extend("force", {
    capabilities = vim.deepcopy(capabilities),
  }, config or {})
end

local function enable(server)
  vim.lsp.enable(server)
end

local function preferred_python_server()
  if has("ty") then
    return "ty"
  end

  if has("pyright") or has("pyright-langserver") then
    return "pyright"
  end

  return nil
end

local function preferred_nix_server()
  if has("nixd") then
    return "nixd"
  end

  if has("nil") then
    return "nil_ls"
  end

  return nil
end

M.servers = {
  bashls = {},
  dockerls = {
    settings = {
      docker = {
        languageserver = {
          formatter = {
            ignoreMultilineInstructions = true,
          },
        },
      },
    },
  },
  -- Keep Dockerfile support, but skip the dedicated docker-compose server for now.
  -- It adds noisy health warnings for specialized YAML sub-filetypes and is not
  -- part of the core Zed-parity workflow.
  gopls = {
    filetypes = { "go", "gomod" },
    settings = {
      gopls = {
        analyses = {
          shadow = true,
          unusedparams = true,
        },
        completeUnimported = true,
        gofumpt = true,
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        semanticTokens = true,
        staticcheck = true,
        usePlaceholders = true,
      },
    },
  },
  graphql = {},
  -- Skip the dedicated Helm server for now. The specialized Helm filetypes are
  -- noisy in health output and are outside the current daily-driver baseline.
  html = {
    settings = {
      html = {
        format = {
          contentUnformatted = "svg,script",
          extraLiners = "div,p",
          indentInnerHtml = true,
        },
      },
    },
  },
  jsonls = {
    settings = {
      json = {
        format = { enable = true },
        validate = { enable = true },
      },
    },
  },
  lua_ls = {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
          path ~= vim.fn.stdpath("config")
          and (uv.fs_stat(path .. "/.luarc.json") or uv.fs_stat(path .. "/.luarc.jsonc"))
        then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
        runtime = {
          version = "LuaJIT",
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
          },
        },
      })
    end,
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        hint = {
          enable = true,
          arrayIndex = "Enable",
          await = true,
          paramName = "All",
          paramType = true,
          semicolon = "Disable",
          setType = true,
        },
      },
    },
  },
  marksman = {
    filetypes = { "markdown" },
  },
  nixd = {},
  nil_ls = {},
  oxlint = {
    settings = {
      fixKind = "safe_fix",
    },
  },
  pyright = {
    settings = {
      python = {
        analysis = {
          autoImportCompletions = true,
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          inlayHints = {
            callArgumentNames = true,
            functionReturnTypes = true,
            pytestParameters = true,
            variableTypes = true,
          },
          useLibraryCodeForTypes = true,
        },
      },
    },
  },
  ruff = {
    init_options = {
      settings = {
        codeAction = {
          disableRuleComment = {
            enable = false,
          },
          fixViolation = {
            enable = true,
          },
        },
        configurationPreference = "filesystemFirst",
        fixAll = true,
        format = {
          preview = true,
        },
        organizeImports = true,
        showSyntaxErrors = true,
      },
    },
  },
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        check = {
          command = "clippy",
        },
        inlayHints = {
          bindingModeHints = {
            enable = true,
          },
          closureReturnTypeHints = {
            enable = "always",
          },
          lifetimeElisionHints = {
            enable = "skip_trivial",
            useParameterNames = true,
          },
          parameterHints = {
            enable = true,
          },
          typeHints = {
            enable = true,
          },
        },
        procMacro = {
          enable = true,
        },
      },
    },
  },
  sqls = {},
  tailwindcss = {
    filetypes = { "html", "css", "javascriptreact", "typescriptreact", "svelte" },
  },
  taplo = {},
  terraformls = {
    filetypes = { "terraform" },
    init_options = {
      experimentalFeatures = {
        prefillRequiredFields = true,
      },
    },
  },
  tflint = {},
  ty = {},
  vtsls = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    settings = {
      javascript = {
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterNames = {
            enabled = "all",
            suppressWhenArgumentMatchesName = false,
          },
          parameterTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          variableTypes = {
            enabled = true,
            suppressWhenTypeMatchesName = true,
          },
        },
        tsserver = {
          maxTsServerMemory = 16184,
        },
      },
      typescript = {
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterNames = {
            enabled = "all",
            suppressWhenArgumentMatchesName = false,
          },
          parameterTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          variableTypes = {
            enabled = true,
            suppressWhenTypeMatchesName = true,
          },
        },
        tsserver = {
          maxTsServerMemory = 16184,
        },
      },
    },
  },
  yamlls = {
    filetypes = { "yaml" },
    settings = {
      yaml = {
        format = {
          enable = true,
          singleQuote = true,
        },
        keyOrdering = false,
        validate = true,
      },
    },
  },
}

M.mason_servers = {
  "bashls",
  "dockerls",
  "gopls",
  "graphql",
  "html",
  "jsonls",
  "lua_ls",
  "marksman",
  "nil_ls",
  "oxlint",
  "pyright",
  "ruff",
  "rust_analyzer",
  "sqls",
  "tailwindcss",
  "taplo",
  "terraformls",
  "tflint",
  "ty",
  "vtsls",
  "yamlls",
}

M.mason_tools = {
  "prettierd",
  "shfmt",
  "shellcheck",
  "stylua",
}

function M.setup()
  for server, config in pairs(M.servers) do
    vim.lsp.config(server, with_capabilities(config))
  end

  for _, server in ipairs({
    "bashls",
    "dockerls",
    "gopls",
    "graphql",
    "html",
    "jsonls",
    "lua_ls",
    "marksman",
    "ruff",
    "rust_analyzer",
    "sqls",
    "tailwindcss",
    "taplo",
    "terraformls",
    "tflint",
    "vtsls",
    "yamlls",
  }) do
    enable(server)
  end

  -- Match Zed more closely: prefer `ty` for Python and `vtsls` + `oxlint`
  -- for JS/TS when those tools are actually available.
  local python_server = preferred_python_server()
  if python_server then
    enable(python_server)
  end

  local nix_server = preferred_nix_server()
  if nix_server then
    enable(nix_server)
  end

  if has("oxlint") then
    enable("oxlint")
  end
end

return M
