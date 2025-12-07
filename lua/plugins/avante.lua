return {
	"yetone/avante.nvim",
	event = 'VeryLazy',
	lazy = false,
	version = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		-- optional dependencies
		"nvim-mini/mini.pick",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/nvim-cmp",
		"ibhagwan/fzf-lua",
		"stevearc/dressing.nvim",
		"folke/snacks.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
	config = function()
		require("avante").setup({
			windows = {
				position = "right",
				width = 45,
			},

			provider = "openai",
			providers = {
				openai = {
					endpoint = "http://192.168.178.52:11434/v1",
					model = "qwen3-coder:30b",
					api_key = "",
				},
			},
		})
	end,
}
