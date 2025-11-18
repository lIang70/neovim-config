-- plugins/go.lua
return {
    {
        -- LS for GO
        "fatih/vim-go",
        ft = "go",
        build = ":GoInstallBinaries",
        config = function()
            vim.g.go_fmt_command = "goimports"
            vim.g.go_auto_type_info = 1
            vim.g.go_def_mapping_enabled = 0
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").gopls.setup({})
        end,
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "leoluz/nvim-dap-go",
        },
        config = function()
            require("dap-go").setup()
        end,
    },
}
