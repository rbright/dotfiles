require("nvim-ts-autotag").setup({
	opts = {
		-- Automatically close tags
		enable_close = true,

		-- Automatically rename pairs of tags
		enable_rename = true,

		-- Don't automatically close tags on slash
		enable_close_on_slash = false,
	},
})
