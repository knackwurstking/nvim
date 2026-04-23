vim.pack.add({
	"https://github.com/iamcco/markdown-preview.nvim",
})

vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_command_for_global = 0
--vim.g.mkdp_browser = "firefox"
--vim.g.mkdp_theme = "gruvbox"

vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-mini/mini.nvim',            -- if you use the mini.nvim suite
    -- 'https://github.com/nvim-mini/mini.icons',        -- if you use standalone mini plugins
    -- 'https://github.com/nvim-tree/nvim-web-devicons', -- if you prefer nvim-web-devicons
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
})

require('render-markdown').setup({}) -- only mandatory if you want to set custom options
