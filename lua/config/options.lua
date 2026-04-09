-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local vg = vim.g
local vo = vim.o
local vwo = vim.wo
local has = vim.fn.has

vo.fileencoding = "utf-8"

-- clipboard: macOS / WSL auto
if has("mac") == 1 then
    vg.clipboard = {
        name = "macOS-clipboard",
        copy = {
            ["+"] = { "pbcopy" },
            ["*"] = { "pbcopy" },
        },
        paste = {
            ["+"] = { "pbpaste" },
            ["*"] = { "pbpaste" },
        },
        cache_enabled = true,
    }
elseif has("wsl") == 1 then
    vg.clipboard = {
        name = "Wsl-clipboard",
        copy = {
            ["+"] = { "clip.exe" },
            ["*"] = { "clip.exe" },
        },
        paste = {
            ["+"] = {
                "powershell.exe",
                "-NoProfile",
                "-Command",
                [[
        [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))
      ]],
            },
            ["*"] = {
                "powershell.exe",
                "-NoProfile",
                "-Command",
                [[
        [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))
      ]],
            },
        },
        cache_enabled = false,
    }
end

-- overrides: LazyVim defaults to 2-space indent
vo.tabstop = 4
vo.shiftwidth = 4

vo.whichwrap = "<,>,[,]"

-- window
vwo.colorcolumn = "80"

-- lsp server to use for rust.
vg.lazyvim_rust_diagnostics = "rust-analyzer"
