return {
    {
        "folke/neoconf.nvim",
        -- make sure neoconf is initialized early, before any lspconfig setups
        lazy = false,
        priority = 1000,
        opts = {
            -- name of the local settings files
            local_settings = ".neoconf.json",
            -- name of the global settings file in your Neovim config directory
            global_settings = "neoconf.json",
            -- import existing settings from other plugins
            import = {
                vscode = true, -- local .vscode/settings.json
                coc = true, -- global/local coc-settings.json
                nlsp = true, -- global/local nlsp-settings.nvim json settings
            },
            -- send new configuration to lsp clients when changing json settings
            live_reload = true,
            -- set the filetype to jsonc for settings files, so you can use comments
            -- make sure you have the jsonc treesitter parser installed!
            filetype_jsonc = true,
            plugins = {
                -- configures lsp clients with settings in the following order:
                -- - lua settings passed in lspconfig setup
                -- - global json settings
                -- - local json settings
                lspconfig = {
                    enabled = true,
                },
                -- configures jsonls to get completion in .nvim.settings.json files
                jsonls = {
                    enabled = true,
                    -- only show completion in json settings for configured lsp servers
                    configured_servers_only = true,
                },
                -- configures lua_ls to get completion of lspconfig server settings
                lua_ls = {
                    -- by default, lua_ls annotations are only enabled in your neovim config directory
                    enabled_for_neovim_config = true,
                    -- explicitly enable adding annotations. Mostly relevant to put in your local .nvim.settings.json file
                    enabled = true,
                },
            },
        },
        config = function(_, opts)
            -- neoconf must be setup BEFORE any lspconfig server setup
            require("neoconf").setup(opts)

            -- neoconf healthcheck uses lspconfig.util.available_servers(), which only lists
            -- servers that have been setup via lspconfig.setup(). LazyVim/Nvim0.11 uses vim.lsp.config,
            -- so we register these servers with autostart=false to avoid duplicate clients.
            pcall(function()
                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup({ autostart = false })
                lspconfig.jsonls.setup({ autostart = false })
            end)
        end,
    },
}
