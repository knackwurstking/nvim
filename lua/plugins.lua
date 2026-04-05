
-- Telescope

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",      -- REQUIRED dependency
	{
		src = "https://github.com/nvim-telescope/telescope.nvim",
		version = "main",
	}
})

-- Oil

vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-mini/mini.icons",
})

require("oil").setup()
