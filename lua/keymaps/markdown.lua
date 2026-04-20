-- Markdown keymaps
-- Markdown-specific operations

vim.keymap.set("n", "<space>cfm", function()
	local file = vim.api.nvim_buf_get_name(0)
	vim.print("Formatting: " .. file)
	if string.match(file, "%.md$") then
		vim.fn.system("npx prettier --write '" .. file .. "'")
		vim.cmd("edit")
	else
		print("Not a markdown file")
	end
end, { desc = "Format markdown with Prettier and tidy all tables" })
