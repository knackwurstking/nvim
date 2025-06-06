return {
	"hedyhli/outline.nvim",
	config = function()
		-- Example mapping to toggle outline
		vim.keymap.set("n", "<leader>co", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

		require("outline").setup({
			-- Your setup opts here (leave empty to use defaults)
			outline_window = {
				auto_close = true,
			},

			preview_window = {
				auto_preview = true,
			},

			symbol_folding = {
				-- Depth past which nodes will be folded by default. Set to false to unfold all on open.
				autofold_depth = 0,
				-- When to auto unfold nodes
				auto_unfold = {
					-- Auto unfold currently hovered symbol
					hovered = true,
					-- Auto fold when the root level only has this many nodes.
					-- Set true for 1 node, false for 0.
					only = true,
				},
				markers = { "", "" },
			},
		})
	end,
}
