vim.keymap.set("n", "<space>bl", "<cmd> ls <CR>", { desc = "List buffers" })
vim.keymap.set("n", "<space>bn", "<cmd> bnext <CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<space>bp", "<cmd> bprevious <CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<space>bd", "<cmd> bd! <CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<space>bD", function()
	local buffers = vim.api.nvim_list_bufs()
	local current_buf = vim.api.nvim_get_current_buf()

	for _, buf in ipairs(buffers) do
		if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end, { desc = "Delete all buffers except current" })
vim.keymap.set("n", "<space>bb", ":e #<CR>", { desc = "Switch to last buffer" })
vim.keymap.set("n", "<space>bg", function()
	--local buffers = vim.api.nvim_list_bufs()
	--local current_buf = vim.api.nvim_get_current_buf()
	local bufnr = vim.fn.input("Enter buffer number: ")
	if bufnr ~= "" then
		vim.api.nvim_set_current_buf(tonumber(bufnr))
	end
end, { desc = "Goto buffer by number" })
