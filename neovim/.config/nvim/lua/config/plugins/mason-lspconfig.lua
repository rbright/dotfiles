-- Setup nvim-cmp capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local uv = vim.uv or vim.loop

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
		"lua_ls",
		"marksman",
		"nil_ls",
		"pyright",
		"sqls",
		"tailwindcss",
		"taplo",
		"yamlls",
	},
})

vim.lsp.config("dockerls", {
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

vim.lsp.config("docker_compose_language_service", {
	capabilities = capabilities,
})

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if path ~= vim.fn.stdpath("config") and (uv.fs_stat(path .. "/.luarc.json") or uv.fs_stat(path .. "/.luarc.jsonc")) then
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

vim.lsp.config("pyright", {
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	},
})

vim.lsp.config("ruff", {
	capabilities = capabilities,
	init_options = {
		settings = {
			-- Server settings should go here
		},
	},
})

-- Use Nix-managed `ruff` directly instead of Mason's Python-based installer.
if vim.fn.executable("ruff") == 1 then
	vim.lsp.enable("ruff")
end

-- Prefer system binaries for these language servers to avoid Mason unzip failures.
if vim.fn.executable("terraform-ls") == 1 then
	vim.lsp.enable("terraformls")
end

if vim.fn.executable("tflint") == 1 then
	vim.lsp.enable("tflint")
end

if vim.fn.executable("kotlin-language-server") == 1 then
	vim.lsp.enable("kotlin_language_server")
end
