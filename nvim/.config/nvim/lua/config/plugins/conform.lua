require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettierd", stop_after_first = true },
		lua = { "stylua" },
		python = { "ruff" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
