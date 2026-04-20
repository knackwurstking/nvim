vim.pack.add({ "https://github.com/saghen/blink.cmp" })

local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	group = group,
	once = true,
	callback = function()
		require("blink.cmp").setup({
			keymap = {
				preset = "super-tab",

				['<C-k>'] = { 'select_prev', 'fallback' },
				['<C-j>'] = { 'select_next', 'fallback' },
				['<C-y>'] = { 'accept', 'fallback' },
			},
			appearance = {
				nerd_font_variant = "mono",
				use_nvim_cmp_as_default = true,
			},
			completion = {
				documentation = { auto_show = false },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		})
	end,
})