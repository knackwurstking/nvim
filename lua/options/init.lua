require("options.lsp")

vim.g.netrw_bufsettings  = 'noma nomod nonu nobl nowrap ro rnu'
vim.g.netrw_browse_split = 0
vim.g.netrw_banner       = 0
--vim.g.netrw_winsize      = 25

vim.o.showtabline        = 0

vim.o.undofile           = true
vim.o.clipboard          = "unnamedplus"
vim.o.laststatus         = 2

vim.o.tabstop            = 4
vim.opt.shiftwidth       = 4
vim.opt.mouse            = "a"

vim.opt.number           = true
vim.opt.relativenumber   = true
vim.opt.syntax           = "enable"

vim.opt.foldmarker       = "{{{,}}}"

vim.opt.spelllang        = { "en_us", "de_de" }
vim.opt.spell            = true
vim.opt.colorcolumn      = "81"

vim.opt.scrolloff        = 3
vim.opt.sidescrolloff    = 3

-- Search settings
vim.opt.ignorecase       = true
vim.opt.smartcase        = false

-- CMD
--vim.cmd("colorscheme retrobox | highlight Normal guifg=none guibg=none")
