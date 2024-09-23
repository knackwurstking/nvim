-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.relativenumber = true
vim.o.wrap = true
vim.o.colorcolumn = "80"

vim.o.foldmethod = "expr"
--vim.o.foldmarker = "{,}"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = true

vim.o.conceallevel = 0

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
