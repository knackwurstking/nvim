-- Core Neovim configuration
-- This file loads the core modules in the correct order

-- Set leader keys first
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("keymaps")
require("lsp")
require("plugins")
