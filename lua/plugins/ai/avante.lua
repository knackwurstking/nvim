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
			provider = "lmstudio",
			providers = {
				openai = {
					endpoint = "http://192.168.178.52:1234/v1",
					model = "qwen/qwen3-coder-30b",
					api_key = "",
					extra_request_body = {
						temperature = 0.7,
						max_tokens = 262144,
					},
				},
			},
		})
	end,
}
