-- Window management keymaps
-- Split and tab operations

-- Window management keymaps

vim.keymap.set('n', '<leader>ww', '<CMD> :tab split <CR>', { desc = 'Split window into new tab' })

-- Split | VSplit

vim.keymap.set('n', '<leader>ws', '<CMD> :vsplit <CR>', { desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>wv', '<CMD> :split <CR>', { desc = 'Horizontal Split' })

-- Save / Quit

vim.keymap.set('n', '<leader>q', '<CMD> :wq <CR>', { desc = 'Close' })
--vim.keymap.set('n', '<leader>s', '<CMD> :ws <CR>', { desc = 'Save' })

-- Tab Management

vim.keymap.set('n', '<leader>tt', '<CMD> :tabnew <CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tc', '<CMD> :tabclose <CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader>tp', '<CMD> :tabprevious <CR>', { desc = 'Previous tab' })
vim.keymap.set('n', '<leader>tn', '<CMD> :tabnext <CR>', { desc = 'Next tab' })

--local function toggle_telescope_for_tabs(harpoon_files)
--	local file_paths = {}
--	for _, item in ipairs(harpoon_files.items) do
--		table.insert(file_paths, item.value)
--	end
--
--	require("telescope.pickers").new({}, {
--		prompt_title = "Harpoon",
--		finder = require("telescope.finders").new_table({
--			results = file_paths,
--		}),
--		previewer = conf.file_previewer({}),
--		sorter = conf.generic_sorter({}),
--	}):find()
--end
--
--vim.keymap.set("n", "<space>ft", function()
--	toggle_telescope_for_tabs(harpoon:list())
--end, { desc = "Open tabs telescope window" })

-- Session Management

vim.keymap.set('n', '<space>ss', '<CMD> :mksession! .session.vim <CR>', { desc = 'Save session' })
vim.keymap.set('n', '<space>sl', '<CMD> :source .session.vim <CR>', { desc = 'Load session' })
