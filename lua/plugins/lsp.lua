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
    {
        "tami5/lspsaga.nvim",
        setup = {
            -- defaults ...
            debug = false,
            use_saga_diagnostic_sign = true,
            -- diagnostic sign
            error_sign = "",
            warn_sign = "",
            hint_sign = "",
            infor_sign = "",
            diagnostic_header_icon = "   ",
            -- code action title icon
            code_action_icon = " ",
            code_action_prompt = {

                enable = true,
                sign = true,
                sign_priority = 40,
                virtual_text = true,
            },
            finder_definition_icon = "  ",
            finder_reference_icon = "  ",
            max_preview_lines = 10,
            finder_action_keys = {

                -- open = "o",
                open = "<CR>",
                vsplit = "s",
                split = "i",
                -- quit = "q",
                quit = "<ESC>",
                scroll_down = "<C-f>",
                scroll_up = "<C-b>",
            },
            code_action_keys = {

                -- quit = "q",
                quit = "<ESC>",
                exec = "<CR>",
            },
            rename_action_keys = {

                -- quit = "<C-c>",
                quit = "<ESC>",
                exec = "<CR>",
            },
            definition_preview_icon = "  ",
            border_style = "single",
            rename_prompt_prefix = "➤",
            rename_output_qflist = {

                enable = false,
                auto_open_qflist = false,
            },
            server_filetype_map = {},
            diagnostic_prefix_format = "%d. ",
            diagnostic_message_format = "%m %c",
            highlight_prefix = false,
        },
    },
}
