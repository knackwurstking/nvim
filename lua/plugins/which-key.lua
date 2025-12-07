return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			icons = {
				group = " ", -- This removes the "+" and adds a space instead
			},
			disable = {
			},
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = true,
					suggestions = 20,
				},
			},
		})

		wk.add({
			{ "<space>e", group = "Explorer" },
			{ "<space>f", group = "Files" },
			{ "<space>c", group = "Code" },
			{ "<space>b", group = "Buffers" },
			{ "<space>w", group = "Session" },
			{ "<space>h", group = "Harpoon" },
			--{ "<space>q", group = "Quickfix" },
			{ "<space>a", group = "Avante" },
			{ "<space>x", group = "Trouble" },
		})
	end
}
