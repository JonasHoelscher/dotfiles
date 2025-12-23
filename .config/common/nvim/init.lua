--[[
====================
Neovim configuration
main file
====================
--]]

-- Important general settings

-- Suppress deprecated warnings
vim.deprecate = function() end

-- Set leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- File settings
vim.opt.fileformat = "unix"
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.undofile = true -- Save undo history
vim.cmd([[
	filetype plugin indent on
	syntax enable
]])

-- Editor settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.breakindent = true
vim.opt.ignorecase = true -- Case insensitive searching
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cursorline = true
vim.opt.scrolloff = 4
--  Default settings for tabs
--  Settings for all files except the ones listed in autocommands
vim.opt.expandtab = true -- Tabs as spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
-- Show tabs as >>
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.updatetime = 300
vim.opt.timeoutlen = 300
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes"
vim.opt.winwidth = 80
vim.opt.equalalways = false

-- Highlight spaces at end of line
vim.cmd([[highlight ExtraWhitespace ctermbg=red guibg=red]])
vim.cmd([[match ExtraWhitespace /\s\+$/]])
vim.cmd([[highlight BadWhitespace ctermbg=red guibg=red]])

-- Load 'lazy' plugin manager
require("config.lazy")

-- Load external scripts
require("keymaps")
require("autocommands")
