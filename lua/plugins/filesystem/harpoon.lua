vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	{
		src = "https://github.com/ThePrimeagen/harpoon",
		version = "harpoon2",
	},
})

require("harpoon").setup()
require("harpoon"):extend(require("harpoon.extensions").builtins.highlight_current_file())
