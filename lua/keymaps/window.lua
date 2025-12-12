-- Window management keymaps

vim.keymap.set('n', '<leader>ww', '<CMD> :tab split <CR>', { desc = 'Split window into new tab' })

-- Split | VSplit

vim.keymap.set('n', '<leader>ws', '<CMD> :vsplit <CR>', { desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>wv', '<CMD> :split <CR>', { desc = 'Horizontal Split' })

-- Save / Quit

vim.keymap.set('n', '<leader>q', '<CMD> :wq <CR>', { desc = 'Close' })
vim.keymap.set('n', '<leader>s', '<CMD> :ws <CR>', { desc = 'Save' })
