-- Dependencies:
--  * luarocks                          -> `api install luarocks`
--  * gopls                             -> `go install golang.org/x/tools/gopls@latest`
--  * vscode-languageservers-extracted  -> `npm i -g vscode-languageservers-extracted`

-- {{{ Options

vim.o.undofile      = true
vim.o.clipboard     = "unnamedplus"
vim.o.laststatus    = 0

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.opt.expandtab   = true
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = 4

vim.opt.mouse = "a"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.syntax = "enable"

vim.opt.foldmarker = "{{{,}}}"
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.spelllang = { "en_us", "de_de" }
vim.opt.spell = true

-- }}}

-- {{{ CMD

--vim.cmd("syntax off | colorscheme retrobox | highlight Normal guifg=#ffaf00 guibg=#282828")
vim.cmd("colorscheme retrobox | highlight Normal guifg=none guibg=none")
vim.cmd("set foldmethod=syntax")

-- }}}

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

require("lazy").setup({ -- {{{
    -- Boilerplate for next steps.
    -- From now on, all code examples will go to this section.
    -- {
    --     "https://gitprovider.com/exampleuser/myplugin",
    -- },

    { "neovim/nvim-lspconfig" },

    { -- {{{ nvim-treesitter/nvim-treesitter
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

        config = function () 
          local configs = require("nvim-treesitter.configs")

          configs.setup({
              ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
              sync_install = false,
              highlight = { enable = true },
              indent = { enable = true },  
            })
        end
    }, -- }}}

    { -- {{{ hedyhli/outline.nvim
        "hedyhli/outline.nvim",

        lazy = true,
        cmd = { "Outline", "OutlineOpen" },

        keys = { -- Example mapping to toggle outline
            { "<space>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },

        opts = {
          -- Your setup opts here
        },
    }, -- }}}

    { -- {{{ nvim-telescope/telescope.nvim
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },

        opts = {
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = {
                        width = { padding = 0 },
                        height = { padding = 0 },
                    },
                },
            },
        },
    }, -- }}}

    { -- {{{ rmagatti/auto-session
        'rmagatti/auto-session',
        lazy = false,
    
        opts = {
            suppressed_dirs = { '~/', '~/Downloads', '/' },
            -- log_level = 'debug',
        }
    }, -- }}}

    { -- {{{ hrsh7th/nvim-cmp
        'hrsh7th/nvim-cmp',
        event = "InsertEnter", -- Load on InsertEnter event

        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp-signature-help',
        },

        config = function()
            local cmp = require('cmp')

            cmp.setup {
                mapping = cmp.mapping.preset.insert {
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm { select = true },
                },
                sources = cmp.config.sources {
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'cmp_nvim_lsp_signature_help' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'cmdline' },
                },
            }
        end,
    }, -- }}}

    { -- {{{ nvim-lualine/lualine.nvim
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },

        config = function() 
            require("lualine").setup()
        end,
    }, -- }}}

    { -- {{{ ThePrimeagen/harpoon
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            local harpoon = require('harpoon')
            harpoon:setup({})

            -- basic telescope configuration
            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

            --vim.keymap.set("n", "<C-e>", function() 
            --    toggle_telescope(harpoon:list()) 
            --end, { desc = "Open harpoon window" })

            vim.keymap.set("n", "<space>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        end
    }, -- }}}

    { -- {{{ "akinsho/bufferline.nvim"
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        version = "*",
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    separator_style = "slant",
                    --close_command = "bp|sp|bn|bd! %d",
                    --right_mouse_command = "bp|sp|bn|bd! %d",
                    --left_mouse_command = "buffer %d",
                    buffer_close_icon = "✗",
                    modified_icon = "",
                    close_icon = "",
                    show_close_icon = false,
                    left_trunc_marker = "",
                    right_trunc_marker = "",
                    max_name_length = 14,
                    max_prefix_length = 13,
                    tab_size = 10,
                    show_tab_indicators = true,
                    indicator = {
                        style = "underline",
                    },
                    enforce_regular_tabs = false,
                    view = "multiwindow",
                    show_buffer_close_icons = true,
                    --separator_style = "thin",
                    -- separator_style = "slant",
                    always_show_bufferline = true,
                    diagnostics = false,
                    themable = true,
                },
            })

            vim.keymap.set("n", "<space>bn", "<cmd> BufferLineCycleNext <CR>")
            vim.keymap.set("n", "<space>bp", "<cmd> BufferLineCyclePrev <CR>")
            vim.keymap.set("n", "<space>bl", "<cmd> BufferLineCloseLeft <CR>")
            vim.keymap.set("n", "<space>br", "<cmd> BufferLineCloseRight <CR>")
            vim.keymap.set("n", "<space>bd", "<cmd> bd! <CR>")
            vim.keymap.set("n", "<space>bb", ":e #<CR>")
            vim.keymap.set("n", "<space>bt", "<cmd> BufferLineTogglePin <CR>")
        end,
    }, -- }}}
}) -- }}}

-- LSP

local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

-- {{{ Golang

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

-- }}}

-- {{{ HTML

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
    settings = {
        html = { 
            format = { 
                wrapLineLength = '100',
                wrapAttributes = 'preserve', -- [https://code.visualstudio.com/docs/languages/html#_formatting]
            },
        },
    },

    on_attach = function(client, bufnr)
        -- Enable completion
        if client.supports_method("textDocument/completion") then
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        end
    end,
}

-- }}}

-- {{{ CSS

if not configs.css then
    configs.css = {
        default_config = {
            cmd = { "vscode-css-language-server", "--stdio" },
            filetypes = { "css" },
            root_dir = lspconfig.util.root_pattern(".git"),
            single_file_support = true,

            init_options = {
                provideFormatter = true,
            },
        },
    }
end

lspconfig.css.setup {
    on_attach = function(client, bufnr)
        -- Enable completion
        if client.supports_method("textDocument/completion") then
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        end
    end,
}

-- }}}

-- Enable the LSP
require('lspconfig').gopls.setup {}

-- {{{ Keybindings 

-- LSP commands
local opts = { noremap=true, silent=true, buffer=bufnr }

-- Go to definitions
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

-- Go to references
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

-- Preview on "hover"
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

-- Code action
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)

-- Show diagnostics
vim.keymap.set('n', '<space>cd', vim.diagnostic.open_float, opts)

vim.keymap.set("n", "<c-d>", function()
  vim.diagnostic.setloclist({ open = false }) -- don't open and focus

  local window = vim.api.nvim_get_current_win()

  vim.cmd.lwindow() -- open+focus loclist if has entries, else close -- this is the magic toggle command
  vim.api.nvim_set_current_win(window) -- restore focus to window you were editing (delete this if you want to stay in loclist)
end, { buffer = bufnr })

-- LSP: Format
vim.keymap.set('n', '<space>cf', function() vim.lsp.buf.format { async = true } end, opts)

--vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
--vim.keymap.set('n', '<space>vd', vim.diagnostic.open_float, opts)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>vrr', vim.lsp.buf.references, opts)
--vim.keymap.set('n', '<space>vR', vim.lsp.buf.rename, opts)
--vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)

-- Telescope: Find Files
vim.keymap.set('n', '<space>ff', function() require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<space>fb', require('telescope.builtin').buffers)
vim.keymap.set("n", "<space>fs", '<cmd>Telescope live_grep<CR>')

-- Auto Session (Session Manager)
vim.keymap.set('n', '<space>ws', ':SessionSave<CR>')
vim.keymap.set('n', '<space>wr', ':SessionRestore<CR>')

-- Other keymaps

vim.keymap.set('n', '<space>e', ':Ex<CR>')

vim.keymap.set('n', '<space>ft', ":grep -i -e todo: -e note: -e fixme: * | copen 7<CR>")

--vim.keymap.set('n', '<space>tt', ':tabnew<CR>')
--vim.keymap.set('n', '<space>tc', ':tabclose<CR>')
--vim.keymap.set('n', '<space>tp', ':tabprevious<CR>')
--vim.keymap.set('n', '<space>tn', ':tabnext<CR>')

--vim.keymap.set('n', '<space>bb', '<cmd>:e #<CR>')
--vim.keymap.set('n', '<space>bn', '<cmd>bnext<CR>')
--vim.keymap.set('n', '<space>bp', '<cmd>bprevious<CR>')
--vim.keymap.set('n', '<space>bd', '<cmd>bdelete<CR>')

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)     -- h - Navigate Right
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)     -- j - Navigate Down
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)       -- k - Navigate Up
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)    -- l - Navigate Left

-- }}}

-- TODO: Add some plugin for these languages
--  * [x] golang
--  * [ ] javascript / typescript
--  * [ ] CSS
--  * [x] HTML
--  * [ ] svelte
