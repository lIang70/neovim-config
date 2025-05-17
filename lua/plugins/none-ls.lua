return {
    {
        "nvimtools/none-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            local formatting = null_ls.builtins.formatting
            local code_actions = null_ls.builtins.code_actions

            null_ls.setup({
                debug = false,
                -- #{m}: message
                -- #{s}: source name (defaults to null-ls if not specified)
                -- #{c}: code (if available)
                diagnostics_format = "[#{s}] #{m}",
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end, { desc = "Format current buffer with LSP" })
                    end
                end,
                sources = {
                    -- formatting ---------------------
                    formatting.shfmt, -- StyLua
                    formatting.rustfmt, -- rustfmt
                    formatting.clang_format, -- C++ format
                    -- diagnostics  ---------------------
                    -- code actions ---------------------
                    code_actions.gitsigns,
                },
            })
        end,
    },
}
