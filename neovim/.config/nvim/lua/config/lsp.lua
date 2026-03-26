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
  docker_compose_language_service = {},
  gopls = {
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
  helm_ls = {},
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
  marksman = {},
  nixd = {},
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
  tailwindcss = {},
  taplo = {},
  terraformls = {
    init_options = {
      experimentalFeatures = {
        prefillRequiredFields = true,
      },
    },
  },
  tflint = {},
  ty = {},
  vtsls = {
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
  "docker_compose_language_service",
  "gopls",
  "graphql",
  "helm_ls",
  "html",
  "jsonls",
  "lua_ls",
  "marksman",
  "nixd",
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
    "docker_compose_language_service",
    "gopls",
    "graphql",
    "helm_ls",
    "html",
    "jsonls",
    "lua_ls",
    "marksman",
    "nixd",
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

  if has("oxlint") then
    enable("oxlint")
  end
end

return M
