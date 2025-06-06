vim.g.mapleader = " "

local keymap = vim.keymap

--keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<ESC>", ":nohl<CR>", { desc = "Clear search highlights" })

-- incremenet/decrement numbers
--keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
--keymap.set("n", "<leader>+", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window [V]ertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window [H]orizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits [E]qual size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

--keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
--keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
--keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to [N]ext tab" })
--keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to [P]revious tab" })
--keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in [N]ew tab" })
