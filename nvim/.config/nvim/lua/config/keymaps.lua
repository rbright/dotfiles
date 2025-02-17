-------------------------------------------------------------------------------
-- File Management
-------------------------------------------------------------------------------

-- Leader-w to save
vim.keymap.set("n", "<leader>w", ":w!<CR>")

-- Ctrl-q to quit
vim.keymap.set("n", "<C-q>", ":qall<CR>")

-------------------------------------------------------------------------------
-- Splits
-------------------------------------------------------------------------------

-- Alt-l and Alt-j to split horizontally and vertically
vim.keymap.set("n", "<M-j>", ":split<CR>")
vim.keymap.set("n", "<M-l>", ":vsplit<CR>")

-- Alt-Shift + h/j/k/l to navigate between splits
vim.keymap.set("n", "<M-S-h>", "<C-W>h")
vim.keymap.set("n", "<M-S-j>", "<C-W>j")
vim.keymap.set("n", "<M-S-k>", "<C-W>k")
vim.keymap.set("n", "<M-S-l>", "<C-W>l")

-- Leader-q to close a buffer
vim.keymap.set("n", "<leader>q", ":close<CR>", { noremap = true, silent = true })

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
