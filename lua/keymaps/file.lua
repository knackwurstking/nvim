vim.keymap.set("n", "<space>cm", function()
	local file = vim.api.nvim_buf_get_name(0)
	if string.match(file, "%.md$") then
		vim.fn.system("npx prettier --write " .. file)
		vim.cmd("edit")
		print("Markdown formatted with Prettier and file reloaded")
	else
		print("Not a markdown file")
	end
end, { desc = "Format markdown with Prettier" })
