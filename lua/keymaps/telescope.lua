vim.keymap.set('n', '<space>ff',
	function() require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git' } }) end,
	{ desc = "Find files" })

vim.keymap.set('n', '<space>fb', require('telescope.builtin').buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<space>fs", '<cmd>Telescope live_grep<CR>', { desc = "Live grep" })

--vim.keymap.set('n', '<space>ft', ":grep -i -e todo: -e note: -e fixme: * | copen 7<CR>",
--	{ desc = "Find TODO, NOTE, FIXME" })
