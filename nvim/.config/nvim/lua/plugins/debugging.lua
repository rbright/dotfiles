return {
	-- DAP (Debug Adapter Protocol)
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- UI for nvim-dap
			"rcarriga/nvim-dap-ui",
			-- Virtual text for debugging
			"theHamsta/nvim-dap-virtual-text",
			-- Mason integration for DAP
			"jay-babu/mason-nvim-dap.nvim",
		},
	},
}