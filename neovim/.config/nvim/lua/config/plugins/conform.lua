require("conform").setup({
	formatters_by_ft = {
		javascript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		json = { "prettierd" },
		lua = { "stylua" },
		python = { "ruff_format" },
		sql = { "sqlfluff" },
		typescript = { "eslint_d" },
		typescriptreact = { "eslint_d" },
	},
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
