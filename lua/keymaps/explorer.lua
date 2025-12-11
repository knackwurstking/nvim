-- Netrw settings (disabled in favor of oil.nvim)

--vim.keymap.set('n', '<space>ee', ':Explore<CR>', { desc = "Open explorer" })
--vim.keymap.set('n', '<space>es', ':Lexplore<CR>', { desc = "Open explorer to the side" })

-- oil.nvim
--
-- Default keymaps for oil.nvim navigation
-- 	"-"		: Go up a directory
-- 	"g?"	: Show help
-- 	"<CR>"	: Select file/directory
-- 	"<C-s>"	: Select file/directory in vertical split
-- 	"<C-h>"	: Select file/directory in horizontal split
-- 	"<C-t>"	: Select file/directory in new tab
-- 	"<C-p>"	: Preview file
-- 	"<C-c>"	: Close oil window
-- 	"<C-l>"	: Refresh directory listing
-- 	"_"		: Open current working directory
-- 	"`"		: Change directory
-- 	"~"		: Change directory in new tab
-- 	"gs"	: Change sort order
-- 	"gx"	: Open file externally
-- 	"g."	: Toggle hidden files
-- 	"g\\"	: Toggle trash

vim.keymap.set("n", "<space>ee", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<space>er", "<CMD>Oil .<CR>", { desc = "Open root directory" })
vim.keymap.set("n", "<space>eo", "<CMD>Oil ", { desc = "Open custom directory (No <CR>)" })
