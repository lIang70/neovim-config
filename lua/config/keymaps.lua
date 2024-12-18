-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-v>", '"+p', { noremap = true, silent = true })

local keymap = vim.keymap

-- visual line
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")

keymap.set("n", "<leader>nh", ":nohl<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<C-Up>", "<C-w>k")
keymap.set("n", "<C-Down>", "<C-w>j")
keymap.set("n", "<C-Left>", "<C-w>h")
keymap.set("n", "<C-Right>", "<C-w>l")

-- comment
keymap.set("n", "<C-/>", "gcc")

keymap.set("n", "<S-Right>", ":bnext<CR>")
keymap.set("n", "<S-Left>", ":bprevious<CR>")

vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])
keymap.set("n", "Db", ":call vimspector#ToggleBreakpoint()<cr>")
keymap.set("n", "Dw", ":call vimspector#AddWatch()<cr>")
keymap.set("n", "De", ":call vimspector#Evaluate()<cr>")
