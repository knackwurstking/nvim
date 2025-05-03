return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				separator_style = "slant",
				--close_command = "bp|sp|bn|bd! %d",
				--right_mouse_command = "bp|sp|bn|bd! %d",
				--left_mouse_command = "buffer %d",
				buffer_close_icon = "",
				modified_icon = "",
				close_icon = "",
				show_close_icon = false,
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 14,
				max_prefix_length = 13,
				tab_size = 10,
				show_tab_indicators = true,
				indicator = {
					style = "underline",
				},
				enforce_regular_tabs = false,
				view = "multiwindow",
				show_buffer_close_icons = true,
				--separator_style = "thin",
				-- separator_style = "slant",
				always_show_bufferline = true,
				diagnostics = false,
				themable = true,
			},
		})

		vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
		vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
		vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to [N]ext tab" })
		vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to [P]revious tab" })
		vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in [N]ew tab" })

		-- bufferline
		--vim.keymap.set("n", "<leader>bn", "<cmd> BufferLineCycleNext <CR>", { desc = "Cycle [N]ext" })
		--vim.keymap.set("n", "<leader>bp", "<cmd> BufferLineCyclePrev <CR>", { desc = "Cycle [P]revious" })
		--vim.keymap.set("n", "<leader>bl", "<cmd> BufferLineCloseLeft <CR>", { desc = "Delete [L]eft" })
		--vim.keymap.set("n", "<leader>br", "<cmd> BufferLineCloseRight <CR>", { desc = "Delete [R]ight" })
		--vim.keymap.set("n", "<leader>bd", "<cmd> bd! <CR>", { desc = "[D]lete current" })
		-- TODO: Need this <leader>bb keymap from lazyvim again

		for i = 1, 9 do
			vim.keymap.set("n", "<leader>b" .. i, function()
				require("bufferline").go_to(i)
			end)
		end
	end,
}
