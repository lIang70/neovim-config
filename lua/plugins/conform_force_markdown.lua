return {
    {
        "stevearc/conform.nvim",
        optional = true,
        opts = function(_, opts)
            opts.formatters = opts.formatters or {}

            opts.formatters["markdown-toc"] = vim.tbl_deep_extend("force", opts.formatters["markdown-toc"] or {}, {
                condition = function()
                    return true
                end,
            })

            opts.formatters["markdownlint-cli2"] =
                vim.tbl_deep_extend("force", opts.formatters["markdownlint-cli2"] or {}, {
                    condition = function()
                        return true
                    end,
                })

            opts.formatters["prettier"] = vim.tbl_deep_extend("force", opts.formatters["prettier"] or {}, {
                condition = function()
                    return true
                end,
            })
        end,
    },
}
