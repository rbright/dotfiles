require("nvim-lint").setup({
	linters_by_ft = {
		dockerfile = { "hadolint" },
	},
})
