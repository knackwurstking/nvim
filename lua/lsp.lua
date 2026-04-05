--- First, ensure nvim-lspconfig is registered via vim.pack
vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

-- Then, enable gopls (it will automatically look for the 'gopls' binary in your PATH)
vim.lsp.enable("gopls")
