return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics
            local code_actions = null_ls.builtins.code_actions

            null_ls.setup({
                debug = false,
                sources = {
                    -- formatting ---------------------
                    formatting.shfmt, -- StyLua
                    formatting.rustfmt, -- rustfmt
                    formatting.stylua, -- frontend
                    formatting.prettier.with({
                        filetypes = {
                            "markdown",
                            "javascript",
                            "javascriptreact",
                            "typescript",
                            "typescriptreact",
                            "vue",
                            "css",
                            "scss",
                            "less",
                            "html",
                            "json",
                            "yaml",
                            "graphql",
                        },
                        prefer_local = "node_modules/.bin",
                    }),
                    -- diagnostics  ---------------------
                    diagnostics.eslint.with({
                        prefer_local = "node_modules/.bin",
                    }),
                    -- code actions ---------------------
                    code_actions.gitsigns,
                    code_actions.eslint.with({
                        prefer_local = "node_modules/.bin",
                    }),
                },
                -- #{m}: message
                -- #{s}: source name (defaults to null-ls if not specified)
                -- #{c}: code (if available)
                diagnostics_format = "[#{s}] #{m}",
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({
                            group = augroup,
                            buffer = bufnr,
                        })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({
                                    bufnr = bufnr,
                                })
                            end,
                        })
                    end
                end,
            })
        end,
    },
}
