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
                "lua-language-server",
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
            if ok then
                capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
            end

            opts.servers = opts.servers or {}
            opts.servers["*"] = opts.servers["*"] or {}
            opts.servers["*"].capabilities = vim.tbl_deep_extend(
                "force",
                capabilities,
                opts.servers["*"].capabilities or {}
            )

            opts.setup = opts.setup or {}
            opts.setup.gopls = function()
                Snacks.util.lsp.on({ name = "gopls" }, function(_, client)
                    if client.server_capabilities.semanticTokensProvider then
                        return
                    end

                    client.server_capabilities.semanticTokensProvider = {
                        full = true,
                        range = true,
                        legend = {
                            tokenTypes = {
                                "namespace",
                                "type",
                                "typeParameter",
                                "parameter",
                                "property",
                                "variable",
                                "function",
                                "method",
                                "macro",
                                "keyword",
                                "comment",
                                "string",
                                "number",
                                "operator",
                                "label",
                            },
                            tokenModifiers = {
                                "definition",
                                "readonly",
                                "defaultLibrary",
                                "static",
                                "array",
                                "bool",
                                "chan",
                                "format",
                                "interface",
                                "map",
                                "number",
                                "pointer",
                                "signature",
                                "slice",
                                "string",
                                "struct",
                                "shadowing",
                            },
                        },
                    }
                end)
            end
        end,
    },

    { "mason-org/mason-lspconfig.nvim" },
}
