-- FIXME: Assets not working with this plugin this way
vim.pack.add({
	"https://github.com/selimacerbas/live-server.nvim",
	"https://github.com/selimacerbas/markdown-preview.nvim",
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local ok, mp = pcall(require, "markdown_preview")
		if ok then
			mp.setup({
				instance_mode = "takeover",
				open_browser = true,
				debounce_ms = 300,
			})
		end
	end,
})
