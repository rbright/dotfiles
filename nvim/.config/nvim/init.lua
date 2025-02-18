---@diagnostic disable: undefined-global

require("config.lazy")

--------------------------------------------------------------------------------
-- Prerequisite Settings
--------------------------------------------------------------------------------

-- Configure leader key
vim.g.mapleader = " "
vim.g.maplocaleader = " "

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--------------------------------------------------------------------------------
-- Settings
--------------------------------------------------------------------------------

require("config.keymaps")
require("config.options")

--------------------------------------------------------------------------------
-- Plugins
--------------------------------------------------------------------------------

-- User Interface
require("config.plugins.catppuccin")
require("config.plugins.snacks")
require("config.plugins.oil")
require("config.plugins.bufferline")
require("config.plugins.lualine")
require("config.plugins.noice")

-- Editor
-- require('config.plugins.which-key')
require("config.plugins.trouble")
require("config.plugins.todo-comments")

-- Treesitter
require("config.plugins.nvim-ts-autotag")

-- Formatting
require("config.plugins.conform")

-- Utilities
require("config.plugins.fzf-lua")
