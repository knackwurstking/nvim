-- Syntax highlighting plugins
-- Treesitter parser

return {
	"nvim-treesitter/nvim-treesitter",
	tag = "v0.10.0",
	lazy = false,
	build = ':TSUpdate',
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			indent = { enable = true },
			sync_install = false,
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
