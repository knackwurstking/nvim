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
			{ "<leader>e", group = "[E]xplorer" },
			{ "<leader>s", group = "[S]plit" },
			{ "<leader>t", group = "[T]ab" },
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>x", group = "Trouble" },
			{ "<leader>w", group = "Session" },
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>r", group = "[R]estart" },
			{ "<leader>b", group = "[B]uffer" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.add(opts.defaults)
	end,
}
