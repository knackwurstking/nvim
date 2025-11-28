return {
	'hrsh7th/nvim-cmp',
	event = "InsertEnter",

	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'L3MON4D3/LuaSnip',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-nvim-lsp-signature-help',
	},

	config = function()
		local cmp = require('cmp')

		cmp.setup {
			mapping = cmp.mapping.preset.insert {
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm { select = true },
			},
			sources = cmp.config.sources {
				{ name = 'nvim_lsp' },
				{ name = 'nvim_lua' },
				{ name = 'cmp_nvim_lsp_signature_help' },
				{ name = 'buffer' },
				{ name = 'path' },
				{ name = 'cmdline' },
			},
		}
	end,
}
