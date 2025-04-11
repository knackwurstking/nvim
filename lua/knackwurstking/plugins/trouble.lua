return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
    opts = {
        focus = true,
    },
    cmd = "Trouble",
    keys = {
        { "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble [D]iagnostics" },
        { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open trouble [D]ocument diagnostics" },
        { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble [Q]uickfix list" },
        { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble [L]ocation list" },
        { "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open [T]odos in trouble" },
    },
}
