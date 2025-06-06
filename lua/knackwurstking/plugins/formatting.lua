return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				prettier = {
					append_args = { "--tab-width", "4" },
				},
			},

			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				--javascriptreact = { "prettier" },
				--typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				--markdown = { "prettier" },
				--graphql = { "prettier" },
				--liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "gofumpt", "goimports" },
				templ = { "templ" },
			},
			format_on_save = {
				lsp_fallback = false,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "[F]ormat file or range" })
	end,
}
