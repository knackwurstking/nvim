vim.keymap.set("n", "<c-d>", function()
	vim.diagnostic.setloclist({ open = false })

	local window = vim.api.nvim_get_current_win()

	vim.cmd.lwindow()
	vim.api.nvim_set_current_win(window)
end, { desc = "Toggle diagnostics location list" })

vim.keymap.set("n", "<space>ql", function()
	vim.diagnostic.setqflist()
	vim.cmd("copen")
end, { desc = "Open quickfix list with linter errors" })
