---@diagnostic disable: undefined-global

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.filetypes")
require("config.lazy")
require("config.health").setup()
require("config.options")
require("config.autocmds")
require("config.keymaps")
