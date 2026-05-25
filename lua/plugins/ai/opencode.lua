vim.pack.add({
	"nvim-lua/plenary.nvim",
	"https://github.com/sudo-tee/opencode.nvim",
})

require("opencode").setup({
	keymap = {
		input_window = {
			['<C-s>'] = { 'submit_input_prompt', mode = { 'n', 'i' } },
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				anti_conceal = { enabled = false },
				file_types = { "markdown", "opencode_output" },
			},
			ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
		},
		"saghen/blink.cmp",
		"nvim-telescope/telescope.nvim",
	},
	ui = {
		position = "right",
		window_width = 0.45,
		icons = {
			preset = "text",
		},
		input = {
			min_height = 0.25,
		},
	},
	context = {
		enabled = true,
		current_file = {
			enabled = true,
			show_full_path = true,
		},
		selection = {
			enabled = true,
		},
		diagnostics = {
			warning = true,
			error = true,
		},
	},
})
