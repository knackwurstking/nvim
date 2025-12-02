return {
	"yetone/avante.nvim",
	event = 'VeryLazy',
	lazy = false,
	version = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"nvim-mini/mini.pick",     -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp",        -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua",        -- for file_selector provider fzf
		"stevearc/dressing.nvim",  -- for input provider dressing
		"folke/snacks.nvim",       -- for input provider snacks
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		{
			-- Make sure to set this up properly if you have lazy=true
			'MeanderingProgrammer/render-markdown.nvim',
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
	config = function()
		require("avante").setup({
			provider = "ollama",
			providers = {
				ollama = {
					endpoint = "http://192.168.178.52:11434/v1",
					model = "qwen3-coder:30b-a3b-q8_0",
				},
			},
			--provider = "openai",
			--providers = {
			--	openai = {
			--		endpoint = "http://192.168.178.52:1234/api/v0",
			--		model = "qwen/qwen3-coder-30b",
			--		api_key = "",
			--	},
			--},
			--web_search_engine = {
			--	provider = "google",
			--	proxy = nil,
			--},
			--enable_fastapply = true,
		})
	end,
}
