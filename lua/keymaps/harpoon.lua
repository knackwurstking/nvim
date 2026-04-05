vim.keymap.set("n", "<space>hh", function()
	require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "Toggle harpoon quick menu" })

vim.keymap.set("n", "<space>ha", function() 
	require("harpoon"):list():add() 
end, { desc = "Add file to Harpoon" })

vim.keymap.set("n", "<space>hr", function() 
	require("harpoon"):list():remove() 
end, { desc = "Remove file from Harpoon" })

-- Telescope navigation for Harpoon files
vim.keymap.set("n", "<space>hn", function() 
	require("harpoon"):list():next() 
end, { desc = "Next Harpoon file" })

vim.keymap.set("n", "<space>hp", function() 
	require("harpoon"):list():prev() 
end, { desc = "Previous Harpoon file" })
