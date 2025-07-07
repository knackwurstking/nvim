return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		--local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_installation = true,

			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
				"cmake",

				--"html",
				--"cssls",
				--"tailwindcss",
				--"svelte",
				--"graphql",
				--"emmet_ls",
				--"prismals",
				--"pyright",
				--"templ",
				--"ts_ls",
				--"gopls",
			},
		})

		--mason_tool_installer.setup({
		--	ensure_installed = {
		--		--"prettier", -- prettier formatter
		--		--"stylua", -- lua formatter
		--		--"isort", -- python formatter
		--		--"black", -- python formatter
		--		--"pylint",
		--		--"eslint_d",
		--		--"gofumpt",
		--		--"goimports",
		--		--"typescript-language-server",
		--		--"marksman",
		--		--"typos-lsp",
		--		--"templ",
		--	},
		--})
	end,
}
