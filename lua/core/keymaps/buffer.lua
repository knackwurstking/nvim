-- Buffer management keymaps
-- Navigation and manipulation of buffers

vim.keymap.set("n", "<space>bn", "<cmd> bnext <CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<space>bp", "<cmd> bprevious <CR>", { desc = "Previous buffer" })

vim.keymap.set("n", "<space>bd", "<cmd> bd! <CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<space>bD", "<cmd> %bd|e# <CR>", { desc = "Delete buffer" })

vim.keymap.set("n", "<space>bb", ":e #<CR>", { desc = "Switch to last buffer" })
