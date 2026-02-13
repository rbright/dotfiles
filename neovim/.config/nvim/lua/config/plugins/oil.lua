--------------------------------------------------------------------------------
-- Configuration
--------------------------------------------------------------------------------

require("oil").setup({
	delete_to_trash = false,
	view_options = {
		-- Show files and directories that start with "."
		show_hidden = true,
	},

	float = {
		-- Padding around the floating window
		padding = 2,
		max_width = 90,
		max_height = 0,

		-- border = "rounded",
		win_options = {
			winblend = 0,
		},
	},
})

--------------------------------------------------------------------------------
-- Keymaps
--------------------------------------------------------------------------------

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
