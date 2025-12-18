-- Git-related keymaps
-- Git operations and navigation

-- Lazygit

vim.keymap.set("n", "<space>gg", "<cmd>LazyGit<CR>", { desc = "Open Lazygit" })
vim.keymap.set("n", "<space>gc",
	":AvanteEdit generate a semantic git commit message for the current changes in concise style<CR>",
	{ desc = "Git commit message generation prompt" })
