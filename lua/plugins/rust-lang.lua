vim.o.completeopt = "menuone,noinsert,noselect"

vim.opt.shortmess = vim.opt.shortmess + "c"

return {
    {
        "simrat39/rust-tools.nvim",
        -- Configure LSP through rust-tools.nvim plugin.
        -- rust-tools will configure and enable certain LSP features for us.
        -- See https://github.com/simrat39/rust-tools.nvim#configuration
        opts = {
            tools = {
                runnables = {
                    use_telescope = true,
                },
                inlay_hints = {
                    auto = true,
                    show_parameter_hints = false,
                    parameter_hints_prefix = "",
                    other_hints_prefix = "",
                },
            },

            -- all the opts to send to nvim-lspconfig
            -- these override the defaults set by rust-tools.nvim
            -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
            server = {
                -- on_attach is a callback called when the language server attachs to the buffer
                on_attach = function(_, bufnr)
                    -- This callback is called when the LSP is atttached/enabled for this buffer
                    -- we could set keymaps related to LSP, etc here.
                    -- Hover actions
                    local rt = require("rust-tools")
                    vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                    -- Code action groups
                    vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                end,
                settings = {
                    -- to enable rust-analyzer settings visit:
                    -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
                    ["rust-analyzer"] = {
                        -- enable clippy on save
                        checkOnSave = {
                            command = "clippy",
                        },
                    },
                },
            },
        },
    },
    {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        opts = {
            completion = {
                crates = {
                    enabled = true,
                },
            },
            lsp = {
                enabled = true,
                actions = true,
                completion = true,
                hover = true,
            },
        },
    },
    {
        "mrcjkb/rustaceanvim",
        version = vim.fn.has("nvim-0.10.0") == 0 and "^4" or false,
        ft = { "rust" },
        opts = {
            server = {
                on_attach = function(_, bufnr)
                    vim.keymap.set("n", "<leader>cR", function()
                        vim.cmd.RustLsp("codeAction")
                    end, { desc = "Code Action", buffer = bufnr })
                    vim.keymap.set("n", "<leader>dr", function()
                        vim.cmd.RustLsp("debuggables")
                    end, { desc = "Rust Debuggables", buffer = bufnr })
                end,
                default_settings = {
                    -- rust-analyzer language server configuration
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                            loadOutDirsFromCheck = true,
                            buildScripts = {
                                enable = true,
                            },
                        },
                        -- Add clippy lints for Rust if using rust-analyzer
                        checkOnSave = diagnostics == "rust-analyzer",
                        -- Enable diagnostics if using rust-analyzer
                        diagnostics = {
                            enable = diagnostics == "rust-analyzer",
                        },
                        procMacro = {
                            enable = true,
                            ignored = {
                                ["async-trait"] = { "async_trait" },
                                ["napi-derive"] = { "napi" },
                                ["async-recursion"] = { "async_recursion" },
                            },
                        },
                        files = {
                            excludeDirs = {
                                ".direnv",
                                ".git",
                                ".github",
                                ".gitlab",
                                "bin",
                                "node_modules",
                                "target",
                                "venv",
                                ".venv",
                            },
                        },
                    },
                },
            },
        },
        config = function(_, opts)
            if LazyVim.has("mason.nvim") then
                local package_path = require("mason-registry").get_package("codelldb"):get_install_path()
                local codelldb = package_path .. "/extension/adapter/codelldb"
                local library_path = package_path .. "/extension/lldb/lib/liblldb.dylib"
                local uname = io.popen("uname"):read("*l")
                if uname == "Linux" then
                    library_path = package_path .. "/extension/lldb/lib/liblldb.so"
                end
                opts.dap = {
                    adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb, library_path),
                }
            end
            vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
            if vim.fn.executable("rust-analyzer") == 0 then
                LazyVim.error(
                    "**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
                    { title = "rustaceanvim" }
                )
            end
        end,
    },
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
}
