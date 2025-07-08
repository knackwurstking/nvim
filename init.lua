-- Dependencies:
--  * luarocks                      -> `api install luarocks`
--  * gopls                         -> `go install golang.org/x/tools/gopls@latest`
--  * vscode-html-language-server   -> `npm i -g vscode-languageservers-extracted`

vim.o.undofile      = true
vim.o.clipboard     = "unnamedplus"
vim.o.laststatus    = 0

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.opt.expandtab   = true
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = 4

vim.opt.mouse = "a"

vim.opt.relativenumber = true

vim.opt.syntax = "enable"

--vim.cmd("syntax off | colorscheme retrobox | highlight Normal guifg=#ffaf00 guibg=#282828")
vim.cmd("colorscheme retrobox | highlight Normal guifg=none guibg=none")

vim.keymap.set('n', '<space>e', ':Ex<CR>')

vim.keymap.set('n', '<space>ft', ':grep -ie todo: * | copen 5<CR>')

vim.keymap.set('n', '<space>tp', ':tabprevious<CR>')
vim.keymap.set('n', '<space>tn', ':tabnext<CR>')

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)     -- h - Navigate Right
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)     -- j - Navigate Down
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)       -- k - Navigate Up
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)    -- l - Navigate Left

-- Lazy

-- Visit the project page for the latest installation instructions
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Boilerplate for next steps.
    -- From now on, all code examples will go to this section.
    -- {
    --     "https://gitprovider.com/exampleuser/myplugin",
    -- },

    { "neovim/nvim-lspconfig" }
})

-- LSP

local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

-- Golang

if not configs.gopls then
    configs.gopls = {
        default_config = {
            cmd = { "gopls" },
            filetypes = { "go", "gomod" },
            root_dir = lspconfig.util.root_pattern("go.mod", "go.work"),
            single_file_support = true,
        },
    }
end

lspconfig.gopls.setup {
    on_attach = function(client, bufnr)
      -- Enable completion with nvim-cmp if you are using it
      if vim.tbl_contains(client.server_capabilities.completionProvider.triggerCharacters or {}, '.') then
          require('cmp').setup.buffer { sources = { { name = 'nvim_lsp' } } }
      end

      -- Enable formatting
      if client.server_capabilities.documentFormattingProvider then
         vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,

            callback = function()
               vim.lsp.buf.format { bufnr = bufnr }
            end
         })
      end
    end,
}

-- HTML

if not configs.html then
    configs.html = {
        default_config = {
            cmd = { "vscode-html-language-server", "--stdio" },
            filetypes = { "html", "javascript", "templ" },
            root_dir = lspconfig.util.root_pattern(".git"),
            single_file_support = true,

            init_options = {
                provideFormatter = true,

                embeddedLanguages = {
                    css = true, 
                    javascript = true,
                },

                configurationSection = { 
                    'html', 'css', 'javascript',
                },
            },
        },
    }
end

lspconfig.html.setup {
    on_attach = function(client, bufnr)
        -- Enable completion
        if client.supports_method("textDocument/completion") then
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        end
    end,
}

-- TODO: CSS

-- Enable the LSP
require('lspconfig').gopls.setup {}

-- Keybindings for LSP commands

local opts = { noremap=true, silent=true, buffer=bufnr }

-- Go to definitions
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

-- Go to refereces
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

-- Preview on "hover"
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

-- Code action
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)

-- Show diagnostics
vim.keymap.set('n', '<space>qq', vim.diagnostic.open_float, opts)

vim.keymap.set("n", "<c-q>", function()
  vim.diagnostic.setloclist({ open = false }) -- don't open and focus

  local window = vim.api.nvim_get_current_win()

  vim.cmd.lwindow() -- open+focus loclist if has entries, else close -- this is the magic toggle command
  vim.api.nvim_set_current_win(window) -- restore focus to window you were editing (delete this if you want to stay in loclist)
end, { buffer = bufnr })

-- Format
vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)

--vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
--vim.keymap.set('n', '<space>vd', vim.diagnostic.open_float, opts)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>vrr', vim.lsp.buf.references, opts)
--vim.keymap.set('n', '<space>vR', vim.lsp.buf.rename, opts)
--vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)

-- TODO: Add some plugin for theese languages
-- TODO: Enable code completion somehow
--  * [x] golang
--  * [ ] javascript / typescript
--  * [ ] css
--  * [x] html
--  * [ ] svelte
