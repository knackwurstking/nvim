vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
})

local telescope = require("telescope")

telescope.setup({
	defaults = {
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

telescope.load_extension("ui-select")
