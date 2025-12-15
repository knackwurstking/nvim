-- Syntax highlighting plugins
-- Treesitter parser

return {
	'nvim-treesitter/nvim-treesitter',
	branch = 'main',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		require("nvim-treesitter").setup({
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"printf",
				"query",
				"toml",
				"vim",
				"vimdoc",
				"yaml",
				"templ",
				"go",
				"css",
				"templ",
			},
		})
	end,
}
