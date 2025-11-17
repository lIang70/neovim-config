-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local vg = vim.g
local vopt = vim.opt
local vo = vim.o
local vwo = vim.wo

-- utf8
vg.encodinf = "UTF-8"
vo.fileencoding = "utf-8"

-- clipboard
-- vg.clipboard = {
--    name = "WslClipboard",
--    copy = {
--        ["+"] = "clip.exe",
--        ["*"] = "clip.exe",
--    },
--    paste = {
--        ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--        ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--    },
--    cache_enable = 0,
--}
--vopt.clipboard = "unnamedplus"

vg.clipboard = {
    name = "macOS-clipboard",
    copy = {
        ["+"] = "pbcopy",
        ["*"] = "pbcopy",
    },
    paste = {
        ["+"] = "pbpaste",
        ["*"] = "pbpaste",
    },
    cache_enabled = true,
}

-- line
vopt.relativenumber = true
vopt.number = true
vopt.wrap = false --
vopt.cursorline = true -- highlight
vo.whichwrap = "<,>,[,]"

-- mouse
vopt.mouse:append("a")

-- tab
vopt.tabstop = 4
vopt.shiftwidth = 4
vopt.expandtab = true

-- alignment
vopt.autoindent = true

-- window
vwo.colorcolumn = "80"
vopt.splitright = true
vopt.splitbelow = true
vopt.signcolumn = "yes"
vopt.termguicolors = true

-- search
vopt.ignorecase = true
vopt.smartcase = true

-- auto complete
vg.completeopt = "menu,menuone,noselect,noinsert"

-- lsp server to use for rust.
-- set to "bacon-ls" to use bacon-ls instead of rust-analyzer.
-- only for diagnostics. The rest of LSP support will still be
-- provided by rust-analyzer.
vg.lazyvim_rust_diagnostics = "rust-analyzer"
