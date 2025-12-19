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

-- buffer
map("n", "<S-l>", ":bnext<CR>", opt)
map("n", "<S-h>", ":bprevious<CR>", opt)
map("n", "<S-x>", ":bdelete<CR>", opt)

-- visual
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- lspsage
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt) -- rename
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt) -- code action

-- terminal
map("n", "<leader>th", ":split | terminal<CR>", { noremap = true, silent = true })
map("n", "<leader>tv", ":vsplit | terminal<CR>", { noremap = true, silent = true })
map("n", "<leader>tf", ":tabnew | terminal<CR>", { noremap = true, silent = true })

map("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true })
