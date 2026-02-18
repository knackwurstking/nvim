return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false, -- set this if you want to always pull the latest change
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		provider = "lmstudio",
		providers = {
			lmstudio = {
				__inherited_from = "openai",
				endpoint = "192.168.178.52:1234/v1",
				model = "qwen/qwen3-coder-next",
				api_key = "",
			},
		},
	},
}
