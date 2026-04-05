vim.keymap.set("n", "<space>cc", "<cmd>ClangdToggleDebugInfo<CR>", { desc = "Toggle Clangd debug info" })
vim.keymap.set("n", "<space>cff", function() vim.lsp.buf.format { async = true } end, { desc = "Format current buffer" })
