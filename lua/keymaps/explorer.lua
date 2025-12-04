-- Use <space>e as the leader for explorer commands
vim.keymap.set('n', '<space>es', ':Sex!<CR>', { desc = "Open file explorer with Sex!" })
vim.keymap.set('n', '<space>eS', ':Sex<CR>', { desc = "Open file explorer with Sex" })
vim.keymap.set('n', '<space>ee', ':Explore<CR>', { desc = "Open file explorer with Explore" })
