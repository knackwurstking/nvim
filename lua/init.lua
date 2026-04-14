-- Core Neovim configuration
-- This file loads the core modules in the correct order

-- Set leader keys first
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("lsp")
require("plugins")
require("keymaps")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv()[1] == nil and vim.fn.filereadable(".session.vim") == 1 then
      vim.cmd("silent! source .session.vim")
    end
  end,
  nested = true,
})
