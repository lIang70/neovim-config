-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- copy-paste
map("v", "<C-c>", '"+y', opt)
map("i", "<C-v>", "<C-r>+", opt)
map("n", "<C-v>", '"+p', opt)

-- visual line
map("v", "J", ":m '>+1<CR>gv=gv", opt)
map("v", "K", ":m '<-2<CR>gv=gv", opt)

-- window
map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt)

-- split
map("n", "<leader>sv", "<C-w>v", opt)
map("n", "<leader>sh", "<C-w>s", opt)

-- nvim-tree
map("n", "<A-Up>", "<C-w>k", opt)
map("n", "<A-Down>", "<C-w>j", opt)
map("n", "<A-Left>", "<C-w>h", opt)
map("n", "<A-Right>", "<C-w>l", opt)

-- buffer
map("n", "<S-Right>", ":bnext<CR>", opt)
map("n", "<S-Left>", ":bprevious<CR>", opt)
map("n", "<S-x>", ":bdelete<CR>", opt)

-- visual
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- lspsage
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt) -- rename
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt) -- code action
