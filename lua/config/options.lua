-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- line number
opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false
opt.cursorline = true

opt.mouse:append("a")
opt.clipboard = "unnamedplus"

opt.splitright = true
opt.splitbelow = true

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.signcolumn = "yes"

-- Vimspector options
vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
]])
