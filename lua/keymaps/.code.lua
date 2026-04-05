-- Code-related keymaps
-- Code actions and formatting

vim.keymap.set("n", "<space>cc", "<cmd>ClangdToggleDebugInfo<CR>", { desc = "Toggle Clangd debug info" })
vim.keymap.set("n", "<space>cf", function() vim.lsp.buf.format { async = true } end, { desc = "Format current C buffer" })
