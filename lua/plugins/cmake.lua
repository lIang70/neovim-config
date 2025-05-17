return {
    {
        "Civitasv/cmake-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("cmake-tools").setup({
                cmake_command = "cmake",
                cmake_build_directory = "build",
                cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- For clangd
                cmake_build_options = {},
                cmake_soft_link_compile_commands = true,
                cmake_executor = {
                    name = "quickfix",
                    opts = {},
                },
            })

            -- Keymaps
            vim.keymap.set("n", "<Leader>cg", "<cmd>CMakeGenerate<cr>", { desc = "CMake: Generate" })
            vim.keymap.set("n", "<Leader>cb", "<cmd>CMakeBuild<cr>", { desc = "CMake: Build" })
            vim.keymap.set("n", "<Leader>cr", "<cmd>CMakeRun<cr>", { desc = "CMake: Run" })
            vim.keymap.set("n", "<Leader>cd", "<cmd>CMakeDebug<cr>", { desc = "CMake: Debug" })
        end,
    },
}
