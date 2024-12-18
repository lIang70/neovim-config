return {

    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "v",
                    package_pending = "-",
                    package_uninstalled = "x",
                },
            },
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
                "flake8",
                "lua-language-server",
                "pyproject-flake8",
                "python-lsp-server",
                "rust-analyzer",
            },
        },
    },

    { "williamboman/mason-lspconfig.nvim" },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/typescript.nvim",
            init = function()
                require("lazyvim.util").lsp.on_attach(function(_, buffer)
                    -- stylua: ignore
                    vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
                    vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
                end)
            end,
        },
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- tsserver will be automatically installed with mason and loaded with lspconfig
                ts_sl = {},
                pyright = {},
                bacon_ls = {
                    enabled = diagnostics == "bacon-ls",
                },
                rust_analyzer = {
                    enabled = false,
                },
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with typescript.nvim
                ts_sl = function(_, opts)
                    require("typescript").setup({ server = opts })
                    return true
                end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        },
    },
}
