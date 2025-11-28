vim.keymap.set('n', '<space>ac', '<cmd>AvanteChat<CR>', {
	desc = "Open Avante chat",
})
vim.keymap.set('n', '<space>an', '<cmd>AvanteChatNew<CR>', {
	desc = "Open new Avante chat",
})
vim.keymap.set('n', '<space>ai', '<cmd>AvanteIns<CR>', {
	desc = "Insert text with Avante",
})
vim.keymap.set('n', '<space>ar', '<cmd>AvanteReplace<CR>', {
	desc = "Replace text with Avante",
})
vim.keymap.set('n', '<space>as', '<cmd>AvanteSummarize<CR>', {
	desc = "Summarize with Avante",
})
vim.keymap.set('n', '<space>at', '<cmd>AvanteToggle<CR>', {
	desc = "Toggle Avante",
})
vim.keymap.set('v', '<C-Enter>', ':AvanteEdit<CR>', {
	desc = "Avante Edit",
})
