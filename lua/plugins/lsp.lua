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

    { "mason-org/mason-lspconfig.nvim" },
}
