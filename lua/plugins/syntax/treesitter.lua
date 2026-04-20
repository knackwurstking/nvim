vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main"
	},
})

require("nvim-treesitter").setup({
	ensure_installed = {
		"typescript",
		"html",
		"css",
		"javascript",
		"svelte",
		"go",
		"gomod",
		"templ",
	},
	highlight = {
		enable = true,
	},
})

vim.api.nvim_create_autocmd('FileType', {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
