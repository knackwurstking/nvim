-- Core options configuration
-- General Neovim settings

-- Netrw settings
vim.g.netrw_bufsettings  = 'noma nomod nonu nobl nowrap ro rnu'
vim.g.netrw_browse_split = 0
vim.g.netrw_banner       = 0
vim.g.netrw_winsize      = 25

-- Wildmenu settings
vim.g.wildmenu           = true
vim.g.wildmode           = "longest, list, full"
vim.g.ignorecase         = true

-- UI settings
vim.o.showtabline        = 1
vim.o.undofile           = true
vim.o.clipboard          = "unnamedplus"
vim.o.laststatus         = 2

-- Indentation and formatting
vim.o.tabstop            = 4
vim.opt.shiftwidth       = 4
vim.opt.mouse            = "a"

-- Line numbers
vim.opt.number           = true
vim.opt.relativenumber   = true
vim.opt.syntax           = "enable"

-- Folding
vim.opt.foldmarker       = { "{{{", "}}}" }
vim.opt.foldmethod       = "expr"
vim.opt.foldexpr         = "nvim_treesitter#foldexpr()"
vim.opt.foldenable     = true
vim.cmd("set foldmethod=expr")

-- Spell checking
vim.opt.spelllang     = { "en_us", "de_de" }
vim.opt.spell         = true
vim.opt.colorcolumn   = [[80,120]]

-- Scrolling
vim.opt.scrolloff     = 3
vim.opt.sidescrolloff = 3

-- Search settings
vim.opt.ignorecase    = true
vim.opt.smartcase     = false
