require("options.lsp")

vim.o.undofile         = true
vim.o.clipboard        = "unnamedplus"
vim.o.laststatus       = 2

vim.o.tabstop          = 4
vim.opt.shiftwidth     = 4
vim.opt.mouse          = "a"

vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.syntax         = "enable"

vim.opt.foldmarker     = "{{{,}}}"

vim.opt.spelllang      = { "en_us", "de_de" }
vim.opt.spell          = true
vim.opt.colorcolumn    = "81"

vim.opt.scrolloff      = 10
vim.opt.sidescrolloff  = 10

-- CMD
--vim.cmd("colorscheme retrobox | highlight Normal guifg=none guibg=none")
vim.opt.foldmethod     = "syntax"
