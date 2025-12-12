-- Window management keymaps

vim.keymap.set('n', '<leader>ww', '<CMD> :tab split <CR>', { desc = 'Split window into new tab' })

-- Split | VSplit

vim.keymap.set('n', '<leader>ws', '<CMD> :vsplit <CR>', { desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>wv', '<CMD> :split <CR>', { desc = 'Horizontal Split' })

-- Save / Quit

vim.keymap.set('n', '<leader>q', '<CMD> :wq <CR>', { desc = 'Close' })
vim.keymap.set('n', '<leader>s', '<CMD> :ws <CR>', { desc = 'Save' })

-- Tab Management
vim.keymap.set('n', '<leader>tt', '<CMD> :tabnew <CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tc', '<CMD> :tabclose <CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader>tp', '<CMD> :tabprevious <CR>', { desc = 'Previous tab' })
vim.keymap.set('n', '<leader>tn', '<CMD> :tabnext <CR>', { desc = 'Next tab' })
