-- Syntax highlighting plugins
-- Treesitter parser

return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate'
}
