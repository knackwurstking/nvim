-- AI integration plugins
-- Avante AI assistant

return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
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
					endpoint = "http://192.168.178.53:1234/api/v0",
					model = "mistralai/devstral-small-2-2512",
					--model = "qwen3-coder:30b",
					api_key = "",
					timeout = 30000,
					--extra_request_body = {
					--	temperature = 0.75,
					--	max_tokens = 120000,
					--},
				},
			},
		})
	end,
}
