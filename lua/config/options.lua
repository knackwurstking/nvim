-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.colorcolumn = "80"

vim.o.foldmethod = "marker"
vim.o.foldmarker = "{{{,}}}"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = true
