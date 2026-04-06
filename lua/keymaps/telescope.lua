vim.keymap.set('n', '<space>ff', function()
	require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git' } }) 
end, { desc = "Find files" })

vim.keymap.set('n', '<space>fb', function()
	require('telescope.builtin').buffers()
end, { desc = "Find buffers" })

vim.keymap.set("n", "<space>fs", '<cmd>Telescope live_grep<CR>', { desc = "Live grep" })
