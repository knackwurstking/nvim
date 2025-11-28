return {
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('nvim-tree').setup {
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
			},
			view = {
				width = 30,
				side = 'left',
			},
			git = {
				enable = true,
				ignore = false,
			},
			filters = {
				dotfiles = false,
			},
		}
	end
}
