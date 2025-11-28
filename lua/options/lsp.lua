local lspconfig = require('lspconfig')

if not vim.lsp.config['gopls'] then
	vim.lsp.config['gopls'] = {
		default_config = {
			cmd = { "gopls" },
			filetypes = { "go", "gomod" },
			root_dir = lspconfig.util.root_pattern("go.mod", "go.work"),
			single_file_support = true,
		},
	}
end

local capabilities = require("blink.cmp").get_lsp_capabilities()

local function on_attach(client, bufnr)
	if vim.tbl_contains(client.server_capabilities.completionProvider.triggerCharacters or {}, '.') then
		require('cmp').setup.buffer { sources = { { name = 'nvim_lsp' } } }
	end

	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,

			callback = function()
				vim.lsp.buf.format { bufnr = bufnr }
			end
		})
	end
end

vim.lsp.config['gopls'] = {
	filetypes = { "go" },
	capabilities = capabilities,
	on_attach = on_attach,
}

vim.lsp.config['lua_ls'] = {
	filetypes = { "lua" },
	capabilities = capabilities,
	on_attach = on_attach,
}

vim.lsp.config['templ'] = {
	filetypes = { "templ" },
	capabilities = capabilities,
	on_attach = on_attach,
}

vim.lsp.config['html'] = {
	filetypes = { "html" },
	capabilities = capabilities,
	on_attach = on_attach,
}

vim.lsp.config['ts_ls'] = {
	filetypes = { "javascript", "typescript" },
	capabilities = capabilities,
	on_attach = on_attach,
}

vim.lsp.config['cssls'] = {
	filetypes = { "css" },
	capabilities = capabilities,
	on_attach = on_attach,
}
