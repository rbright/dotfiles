---@diagnostic disable: undefined-global

require("config.lazy")

--------------------------------------------------------------------------------
-- Prerequisite Settings
--------------------------------------------------------------------------------

-- Configure leader key
vim.g.mapleader = " "

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 24-bit RGB color
vim.opt.termguicolors = true

-- Set colorscheme
vim.cmd.colorscheme "catppuccin"

--------------------------------------------------------------------------------
-- Plugins
--------------------------------------------------------------------------------

require("catppuccin").setup()
require("oil").setup()
require("bufferline").setup()
require('lualine').setup()

--------------------------------------------------------------------------------
-- General settings
--------------------------------------------------------------------------------

-- Copy indent from current line when starting a new line
vim.opt.autoindent = true

-- Automatically write a file when leaving a modified buffer
vim.opt.autowrite = true

-- Allow backspacing over everything in insert mode
vim.opt.backspace = "indent,eol,start"

-- Show a vertical line at column 80
vim.opt.colorcolumn = "80"

-- Copy the structure of existing lines indent when autoindenting
vim.opt.copyindent = true

-- Highlight the current line
vim.opt.cursorline = true

-- Set the character encoding used inside Neovim
vim.opt.encoding = "utf-8"

-- Convert tabs to spaces
vim.opt.expandtab = true

-- Configure how Neovim formats text
vim.opt.formatoptions = "qrn1"

-- Substitute all matches in a line by default with :s
vim.opt.gdefault = true

-- Allow switching buffers without saving
vim.opt.hidden = true

-- Number of commands to remember in history
vim.opt.history = 1000

-- Highlight all matches of previous search pattern
vim.opt.hlsearch = true

-- Ignore case in search patterns
vim.opt.ignorecase = true

-- Show where the pattern matches as you type
vim.opt.incsearch = true

-- Always show the status line
vim.opt.laststatus = 2

-- Characters to display for tabs and trailing spaces
vim.opt.listchars = { tab = "▸ ", trail = "·" }

-- Show invisible characters
vim.opt.list = true

-- Disable modelines (security measure)
vim.opt.modelines = 0

-- Enable mouse support in all modes
vim.opt.mouse = "a"

-- Don't show absolute line numbers
vim.opt.number = false

-- Show relative line numbers
vim.opt.relativenumber = true

-- Show cursor position in status line
vim.opt.ruler = true

-- Minimum number of lines to keep above/below cursor
vim.opt.scrolloff = 3

-- Number of spaces for each step of autoindent
vim.opt.shiftwidth = 2

-- Show partial command in last line of screen
vim.opt.showcmd = true

-- Briefly jump to matching bracket when inserting one
vim.opt.showmatch = true

-- Show current mode in command-line
vim.opt.showmode = true

-- Override ignorecase if search pattern has upper case
vim.opt.smartcase = true

-- Insert spaces or tabs to go to next indent
vim.opt.smarttab = true

-- Number of spaces tab counts for while editing
vim.opt.softtabstop = 2

-- Open new split panes to bottom
vim.opt.splitbelow = true

-- Open new split panes to right
vim.opt.splitright = true

-- Disable swap files
vim.opt.swapfile = false

-- Number of spaces tab counts for
vim.opt.tabstop = 2

-- Maximum width of text being inserted
vim.opt.textwidth = 79

-- Enable timeout for key code sequences
vim.opt.ttimeout = true

-- Time in ms to wait for a key code sequence to complete
vim.opt.ttimeoutlen = 100

-- Enable persistent undo
vim.opt.undofile = true

-- Maximum number of changes that can be undone
vim.opt.undolevels = 1000

-- Time in ms for triggering CursorHold event
vim.opt.updatetime = 100

-- Patterns to ignore during file-navigation
vim.opt.wildignore = "*.swp,*.bak,*.pyc,*.class"

-- Enable command-line completion
vim.opt.wildmenu = true

-- List all matches and complete till longest common string
vim.opt.wildmode = "list:longest"

-- Don't wrap long lines
vim.opt.wrap = false

-- Basic key mappings
vim.keymap.set("n", ";", ":")
vim.keymap.set("i", "jj", "<ESC>")

-- Function key mappings
vim.keymap.set({ "i", "n", "v" }, "<F1>", "<ESC>")

-- Split management
vim.keymap.set("n", "<C-d>", ":split<CR>")
vim.keymap.set("n", "<C-a>", ":vsplit<CR>")

-- Leader mappings
vim.keymap.set("n", "<leader>w", ":w!<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<leader>W", ":%s/\\s\\+$//<CR>:let @/=''<CR>")

-- Other useful mappings
vim.keymap.set("n", "Q", "@q")
vim.keymap.set("v", "Z", "gq")
vim.keymap.set("n", "Z", "gqap")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("v", "/", "/\\v")

-- Enable syntax highlighting
vim.opt.syntax = "on"

-- Set shell
vim.opt.shell = "/Users/rbright/.nix-profile/bin/nu"

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
