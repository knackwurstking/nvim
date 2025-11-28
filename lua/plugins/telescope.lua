return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },

	opts = {
		defaults = {
			layout_strategy = 'horizontal',
			layout_config = {
				horizontal = {
					width = { padding = 0 },
					height = { padding = 0 },
				},
			},
		},
	},
}
