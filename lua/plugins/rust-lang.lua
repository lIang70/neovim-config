vim.o.completeopt = "menuone,noinsert,noselect"

vim.opt.shortmess = vim.opt.shortmess + "c"

return {
    {
        "williamboman/mason.nvim",
        optional = true,
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "codelldb" })
            if diagnostics == "bacon-ls" then
                vim.list_extend(opts.ensure_installed, { "bacon" })
            end
        end,
    },
    {
        "nvim-neotest/neotest",
        optional = true,
        opts = {
            adapters = {
                ["rustaceanvim.neotest"] = {},
            },
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("null-ls").setup()
        end,
    },
}
