-- Syntax highlighting plugins
-- Treesitter parser

return {
	"nvim-treesitter/nvim-treesitter",
	tag = 'v0.10.0',
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"javascript",
				"go",
				"css",
				"templ",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
