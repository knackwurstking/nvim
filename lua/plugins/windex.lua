return {
	'declancm/windex.nvim',
	opts = {
		default_keymaps = false,
		extra_keymaps = false,
		save_buffers = false,
	},
	config = function()
		vim.keymap.set('n', '<space>z', "<cmd>lua require('windex').toggle_maximize()<CR>",
			{ desc = "Toggle maximize window" })
	end,
}
