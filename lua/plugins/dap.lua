return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui", -- Optional UI for dap
            "mxsdev/nvim-dap-vscode-js", -- For JavaScript debugging
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- DAP UI setup
            dapui.setup()

            -- Keymaps
            vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
            vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
            vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
            vim.keymap.set("n", "<Leader>dr", dapui.toggle, { desc = "DAP: Toggle UI" })

            -- cpptools configuration
            dap.adapters.cppdbg = {
                id = "cppdbg",
                type = "executable",
                command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
            }

            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtEntry = true,
                },
            }
            dap.configurations.c = dap.configurations.cpp
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap",
        },
    },
}
