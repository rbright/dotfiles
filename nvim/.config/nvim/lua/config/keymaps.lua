-------------------------------------------------------------------------------
-- File Management
-------------------------------------------------------------------------------

-- Leader-w to save
vim.keymap.set("n", "<leader>w", ":w!<CR>")

-- Leader-q to quit
vim.keymap.set("n", "<leader>q", ":q!<CR>")

-------------------------------------------------------------------------------
-- Buffers
-------------------------------------------------------------------------------

-- Leader-b to switch buffer
vim.keymap.set("n", "<C-D-h>", ":bprev<cr>")
vim.keymap.set("n", "<C-D-j>", ":bnext<cr>")
vim.keymap.set("n", "<C-D-k>", ":bprev<cr>")
vim.keymap.set("n", "<C-D-l>", ":bnext<cr>")

-- Ctrl-q to close a buffer
vim.keymap.set("n", "<C-q>", ":bd<cr>", { noremap = true, silent = true })

-------------------------------------------------------------------------------
-- Splits
------------------------------------------------------------------------------

-- Ctrl-Shift + h/j/k/l to split horizontally and vertically
vim.keymap.set("n", "<C-S-h>", ":vsplit<CR>")
vim.keymap.set("n", "<C-S-j>", ":split<CR>")
vim.keymap.set("n", "<C-S-k>", ":split<CR>")
vim.keymap.set("n", "<C-S-l>", ":vsplit<CR>")

-- Ctrl + h/j/k/l to navigate between splits
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")

-------------------------------------------------------------------------------
-- Search
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>", { silent = true })

-------------------------------------------------------------------------------
-- Editing
-------------------------------------------------------------------------------

--- Q to execute the recorded macro
vim.keymap.set("n", "Q", "@q")

-- Z to format the current paragraph or selection
vim.keymap.set("v", "Z", "gq")
vim.keymap.set("n", "Z", "gqap")

-- Reselect visual block after indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-------------------------------------------------------------------------------
-- Miscellaneous
-------------------------------------------------------------------------------

-- Remap ESC to jj for faster mode switches
vim.keymap.set("i", "jj", "<ESC>")

-- Remap ; to : for faster commands
vim.keymap.set("n", ";", ":")

-- Ignore F1
vim.keymap.set({ "i", "n", "v" }, "<F1>", "<ESC>")

-------------------------------------------------------------------------------
-- Standard Editor Bindings
-------------------------------------------------------------------------------

-- Cmd-p for file finder (using Snacks.nvim)
vim.keymap.set("n", "<D-p>", function() Snacks.picker.files() end, { desc = "Find Files" })

-- Cmd-Shift-p for command palette
vim.keymap.set("n", "<D-S-p>", ":Snacks picker.commands<CR>", { desc = "Command Palette" })

-- Cmd-` for terminal toggle
vim.keymap.set("n", "<D-`>", function() Snacks.terminal.toggle() end, { desc = "Toggle Terminal" })
