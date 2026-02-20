-- LSP configuration
-- Language server protocol setup

local lspconfig = require("lspconfig")

-- Ensure gopls configuration exists
if not vim.lsp.config["gopls"] then
	vim.lsp.config["gopls"] = {
		default_config = {
			cmd = { "gopls" },
			filetypes = { "go", "gomod" },
			root_dir = lspconfig.util.root_pattern("go.mod", "go.work"),
			single_file_support = true,
		},
	}
end

-- Common on_attach function for all LSP servers
local function on_attach(client, bufnr)
	-- Enable completion for servers that support it
	if vim.tbl_contains(client.server_capabilities.completionProvider.triggerCharacters or {}, ".") then
		require("cmp").setup.buffer({ sources = { { name = "nvim_lsp" } } })
	end

	-- Auto-format on save for servers that support it
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

-- Configure individual LSP servers
vim.lsp.config["gopls"] = {
	filetypes = { "go" },
	on_attach = on_attach,
	settings = {
		Go = {
			analyses = {
				unusedparams = true,
				unusedwrite = true,
				shadow = true,
				missingimport = true,
				noop = true,
			},
			diagnostics = {
				enabled = true,
			},
			completeUnimported = true,
			usePlaceholders = true,
			staticcheck = true,
		},
	},
}

vim.lsp.config["lua_ls"] = {
	filetypes = { "lua" },
	on_attach = on_attach,
}

vim.lsp.config["templ"] = {
	filetypes = { "templ" },
	on_attach = on_attach,
}

vim.lsp.config["html"] = {
	filetypes = { "html" },
	on_attach = on_attach,
}

vim.lsp.config["ts_ls"] = {
	filetypes = { "javascript", "typescript" },
	on_attach = on_attach,
}

vim.lsp.config["cssls"] = {
	filetypes = { "css" },
	on_attach = on_attach,
}
