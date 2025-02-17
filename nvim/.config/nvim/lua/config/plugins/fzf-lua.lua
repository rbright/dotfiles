-------------------------------------------------------------------------------
-- Configuration
-------------------------------------------------------------------------------

require('fzf-lua').setup()

-------------------------------------------------------------------------------
-- Keymaps
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>,", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", { desc = "Switch Buffer" })
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find Files (Root Dir)" })
vim.keymap.set("n", "<leader>gc", "<cmd>FzfLua git_commits<CR>", { desc = "Commits" })
vim.keymap.set("n", "<leader>gs", "<cmd>FzfLua git_status<CR>", { desc = "Status" })
vim.keymap.set("n", "<leader>sg", "<cmd>FzfLua live_grep<cr>", { desc = "Grep (Root Dir)" })
