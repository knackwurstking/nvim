vim.keymap.set("n", "<space>bn", "<cmd> bnext <CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<space>bp", "<cmd> bprevious <CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<space>bd", "<cmd> bd! <CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<space>bb", ":e #<CR>", { desc = "Switch to last buffer" })
vim.keymap.set("n", "<space>bt", "<cmd> BufferLineTogglePin <CR>", { desc = "Toggle buffer pin" })

vim.keymap.set("n", "<space>bl", '<cmd> BufferLineCloseLeft <CR>', {
	desc = "Delete all buffers to the left" })

vim.keymap.set("n", "<space>br", '<cmd> BufferLineCloseRight <CR>', {
	desc = "Delete all buffers to the right" })
