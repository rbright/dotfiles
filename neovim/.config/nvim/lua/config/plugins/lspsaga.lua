local M = {}

function M.setup()
	require("lspsaga").setup({
		ui = {
			theme = "round",
			border = "rounded",
			winblend = 0,
			expand = "",
			collapse = "",
			code_action = "💡",
			incoming = " ",
			outgoing = " ",
			hover = " ",
			kind = {},
		},
		hover = {
			max_width = 0.6,
			open_link = "gx",
			open_browser = "!chrome",
		},
		diagnostic = {
			on_insert = false,
			on_insert_follow = false,
			insert_winblend = 0,
			show_code_action = true,
			show_source = true,
			jump_num_shortcut = true,
			max_width = 0.7,
		},
		code_action = {
			num_shortcut = true,
			show_server_name = false,
			extend_gitsigns = true,
		},
		lightbulb = {
			enable = true,
			enable_in_insert = true,
			sign = true,
			sign_priority = 40,
			virtual_text = true,
		},
		finder = {
			edit = { "o", "<CR>" },
			vsplit = "s",
			split = "i",
			tabe = "t",
			quit = { "q", "<ESC>" },
		},
		symbol_in_winbar = {
			enable = true,
			separator = " › ",
			hide_keyword = true,
			show_file = true,
			folder_level = 1,
		},
	})
end

return M