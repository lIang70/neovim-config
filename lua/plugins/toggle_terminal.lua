return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        direction = "float",
        open_mapping = [[<c-\>]],
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        close_on_exit = true,
        float_opts = {
            border = "rounded",
            winblend = 0,
        },
    },
    keys = {
        { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Terminal (Toggle)" },
        { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal (Float)" },
        { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal (Horizontal)" },
        { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Terminal (Vertical)" },
        { "<C-q>", [[<C-\><C-n><cmd>ToggleTerm<cr>]], mode = "t", desc = "Terminal: Hide" },
    },
}
