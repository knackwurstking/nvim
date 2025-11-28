local harpoon = require('harpoon')
harpoon:setup({})

local conf = require("telescope.config").values

local function toggle_telescope_for_harpoon_files(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers").new({}, {
		prompt_title = "Harpoon",
		finder = require("telescope.finders").new_table({
			results = file_paths,
		}),
		previewer = conf.file_previewer({}),
		sorter = conf.generic_sorter({}),
	}):find()
end

vim.keymap.set("n", "<space>ht", function()
	toggle_telescope_for_harpoon_files(harpoon:list())
end, { desc = "Open harpoon telescope window" })

vim.keymap.set("n", "<space>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle harpoon quick menu" })

vim.keymap.set("n", "<space>ha", function() harpoon:list():add() end, { desc = "Add file to Harpoon" })
vim.keymap.set("n", "<space>hn", function() harpoon:list():next() end, { desc = "Next Harpoon file" })
vim.keymap.set("n", "<space>hp", function() harpoon:list():prev() end, { desc = "Previous Harpoon file" })
vim.keymap.set("n", "<space>hr", function() harpoon:list():remove() end,
	{ desc = "Remove file from Harpoon" })
