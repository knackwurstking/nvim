--- First, ensure nvim-lspconfig is registered via vim.pack
vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

-- Then, enable gopls (it will automatically look for the 'gopls' binary in your PATH)
-- NOTE: Run `:help lspconfig-all` to get a full list of supported servers
vim.lsp.enable({
	"gopls",
	"lua_ls",
	"templ",
	"tailwindcss",
	"marksman",
})
