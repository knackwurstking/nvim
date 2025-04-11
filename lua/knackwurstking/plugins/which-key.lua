return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        defaults = {
            -- TODO: Fix the mappings, seems to have change over time
            { "<leader>e", group = "[E]xplorer" },
            {"<leader>s", group = "[S]plit" },
            {"<leader>t", group = "[T]ab" },
            {"<leader>f", group = "[F]ind" },
            {"<leader>x", group = "Trouble" },
            {"<leader>w", group = "Session" },
        },
    },
	config = function(_, opts)
	  local wk = require("which-key")
	  wk.setup(opts)
	  wk.add(opts.defaults)
	end,
}
