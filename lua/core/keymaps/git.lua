-- Git-related keymaps
-- Git operations and navigation

-- Lazygit

vim.keymap.set("n", "<space>gg", "<cmd>LazyGit<CR>", { desc = "Open Lazygit" })
vim.keymap.set("n", "<space>gc",
	":AvanteEdit generate a git commit message<CR>",
	{ desc = "Git commit message generation prompt" })
