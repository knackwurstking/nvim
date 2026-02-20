-- Core Neovim configuration
-- This file loads the core modules in the correct order

-- Set leader keys first
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core options
require("core.options")

-- Load plugin manager
require("core.plugins")

-- Load keymaps
require("core.keymaps")

-- Load LSP configuration
require("core.lsp")
