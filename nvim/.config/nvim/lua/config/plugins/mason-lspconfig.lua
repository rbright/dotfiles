-- Setup nvim-cmp capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup({
	automatic_installation = false,
	ensure_installed = {
		"bashls",
		"dockerls",
		"docker_compose_language_service",
		"eslint",
		"golangci_lint_ls",
		"gopls",
		"graphql",
		"helm_ls",
		"html",
		"jsonls",
		"kotlin_language_server",
		"lua_ls",
		"marksman",
		"nil_ls",
		"pyright",
		"ruff",
		"sqls",
		"tailwindcss",
		"taplo",
		"terraformls",
		"tflint",
		"yamlls",
	},
})

require("lspconfig").dockerls.setup({
	capabilities = capabilities,
	settings = {
		docker = {
			languageserver = {
				formatter = {
					ignoreMultilineInstructions = true,
				},
			},
		},
	},
})

require("lspconfig").docker_compose_language_service.setup({
	capabilities = capabilities,
})

require("lspconfig").lua_ls.setup({
	capabilities = capabilities,
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				},
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
				-- library = vim.api.nvim_get_runtime_file("", true)
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

require("lspconfig").pyright.setup({
	capabilities = capabilities,
	python = {
		analysis = {
			autoSearchPaths = true,
			diagnosticMode = "openFilesOnly",
			useLibraryCodeForTypes = true,
		},
	},
})

require("lspconfig").ruff.setup({
	capabilities = capabilities,
	init_options = {
		settings = {
			-- Server settings should go here
		},
	},
})
