vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate left window" })                                 -- h - Navigate Right
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate down window" })                                 -- j - Navigate Down
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate up window" })                                   -- k - Navigate Up
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Navigate right window" }) -- l - Navigate Left

-- Open quickfix list with linter errors
vim.keymap.set("n", "<space>ql", vim.diagnostic.setqflist, { desc = "Open quickfix list with linter errors" })