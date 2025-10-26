return {
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "v",
                    package_pending = "-",
                    package_uninstalled = "x",
                },
            },
            ensure_installed = {
                "cpptools",
                "debugpy",
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

    { "mason-org/mason-lspconfig.nvim" },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/typescript.nvim",
        },
        init = function()
            local function typescript_keymaps(bufnr)
                -- stylua: ignore
                vim.keymap.set(
                    "n",
                    "<leader>co",
                    "<cmd>TypescriptOrganizeImports<CR>",
                    { buffer = bufnr, desc = "Organize Imports" })
                vim.keymap.set(
                    "n",
                    "<leader>cR",
                    "<cmd>TypescriptRenameFile<CR>",
                    { desc = "Rename File", buffer = bufnr }
                )
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)

                    if client and client.name == "tsserver" then
                        typescript_keymaps(bufnr)
                    end
                end,
            })
        end,
        opts = {
            servers = {
                tsserver = {},
                pyright = {},
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                                loadOutDirsFromCheck = true,
                                runBuildScripts = true,
                            },
                            checkOnSave = {
                                allFeatures = true,
                                command = "clippy",
                                extraArgs = { "--no-deps" },
                            },
                            procMacro = {
                                enable = true,
                            },
                            formatting = {
                                rustfmt = {
                                    enable = true,
                                },
                            },
                        },
                    },
                },
            },
            setup = {
                tsserver = function(_, opts)
                    require("typescript").setup({ server = opts })
                    return true
                end,
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
