--- First, ensure nvim-lspconfig is registered via vim.pack
vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

-- Then, enable gopls (it will automatically look for the 'gopls' binary in your PATH)
-- NOTE: Run `:help lspconfig-all` to get a full list of supported servers
vim.lsp.enable({
	"gopls",    -- INSTALL: `go install golang.org/x/tools/gopls@latest`
	"lua_ls",   -- INSTALL: `brew install lua-language-server`
	"templ",    -- INSTALL: `go install github.com/a-h/templ/cmd/templ@latest`
	"tailwindcss", -- INSTALL: `npm install -g @tailwindcss/language-server`
	"marksman", -- INSTALL: `brew install marksman`
	"llm_ls",   -- INSTALL: `brew install llm`
	"jsonls",   -- INSTALL: `npm i -g vscode-langservers-extracted`
	"cssls",    -- INSTALL: `npm i -g vscode-langservers-extracted`
	"html",     -- INSTALL: `npm i -g vscode-langservers-extracted`
})

vim.lsp.config("html", {
	settings = {
		html = {
			format = {
				wrapLineLength = 0,   -- Disable wrapping based on line length
				wrapAttributes = "auto", -- Only wrap attributes if necessary
				--unformatted = { "span" }, -- List of tags that shouldn't be reformatted
				contentUnformatted = { "pre" }, -- Content in these tags will not be touched
			},
		},
	},
})
