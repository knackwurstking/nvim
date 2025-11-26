-- Dependencies:
--  * luarocks                          -> `api install luarocks`
--  * gopls                             -> `go install golang.org/x/tools/gopls@latest`
--  * vscode-languageservers-extracted  -> `npm i -g vscode-languageservers-extracted`

-- Options
vim.o.undofile         = true
vim.o.clipboard        = "unnamedplus"
vim.o.laststatus       = 0

vim.o.tabstop          = 4
--vim.opt.expandtab   = true
vim.opt.shiftwidth     = 4
--vim.opt.softtabstop = 4

vim.opt.mouse          = "a"

vim.opt.number         = true
vim.opt.relativenumber = true

vim.opt.syntax         = "enable"

vim.opt.foldmarker     = "{{{,}}}"
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.spelllang      = { "en_us", "de_de" }
vim.opt.spell          = true

-- {{{ CMD
--vim.cmd("syntax off | colorscheme retrobox | highlight Normal guifg=#ffaf00 guibg=#282828")
vim.cmd("colorscheme retrobox | highlight Normal guifg=none guibg=none")
vim.cmd("set foldmethod=syntax")
-- }}}

-- Lazy
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

		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "go", "css" },
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
	},                   -- }}}

	{                    -- {{{ hrsh7th/nvim-cmp
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

	{ -- {{{ gruvbox
		'morhetz/gruvbox',
		config = function()
			vim.cmd("colorscheme gruvbox")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end
	}, -- }}}

	{ -- {{{ nvim-tree/nvim-tree
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require('nvim-tree').setup {
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
				},
				auto_reload = true,
				view = {
					width = 30,
					side = 'left',
				},
				git = {
					enable = true,
					ignore = false,
				},
				filters = {
					dotfiles = false,
				},
			}
		end
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

			-- Harpoon keymaps with more intuitive bindings
			vim.keymap.set("n", "<space>ha", function() harpoon:list():add() end, { desc = "Add file to Harpoon" })
			vim.keymap.set("n", "<space>hn", function() harpoon:list():next() end, { desc = "Next Harpoon file" })
			vim.keymap.set("n", "<space>hp", function() harpoon:list():prev() end, { desc = "Previous Harpoon file" })
			vim.keymap.set("n", "<space>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
				{ desc = "Open Harpoon menu" })
			vim.keymap.set("n", "<space>hr", function() harpoon:list():remove() end,
				{ desc = "Remove file from Harpoon" })
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

			vim.keymap.set("n", "<space>bn", "<cmd> BufferLineCycleNext <CR>", { desc = "Next buffer" })
			vim.keymap.set("n", "<space>bp", "<cmd> BufferLineCyclePrev <CR>", { desc = "Previous buffer" })
			vim.keymap.set("n", "<space>bl", "<cmd> BufferLineCloseLeft <CR>", { desc = "Close left buffers" })
			vim.keymap.set("n", "<space>br", "<cmd> BufferLineCloseRight <CR>", { desc = "Close right buffers" })
			vim.keymap.set("n", "<space>bd", "<cmd> bd! <CR>", { desc = "Delete buffer" })
			vim.keymap.set("n", "<space>bb", ":e #<CR>", { desc = "Switch to last buffer" })
			vim.keymap.set("n", "<space>bt", "<cmd> BufferLineTogglePin <CR>", { desc = "Toggle buffer pin" })
		end,
	}, -- }}}

	{ -- {{{ folke/which-key
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")

			wk.setup({
				-- Configure to show cleaner display without group indicators
				icons = {},
				-- Disable the default key descriptions that might interfere
				disable = {
					-- Disable for specific modes if needed
					-- "i", -- Insert mode
				},
				-- Add more detailed descriptions for specific commands
				plugins = {
					marks = true, -- shows a list of your marks on 'm'
					registers = true, -- shows your registers on ':'
					spelling = {
						enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
						suggestions = 20, -- how many suggestions should be shown in the list?
					},
				},
			})

			-- Mappings, rename groups
			wk.add({
				{ "<space>f", group = "Files" },
				{ "<space>c", group = "Code" },
				{ "<space>b", group = "Buffers" },
				{ "<space>w", group = "Session" },
				{ "<space>h", group = "Harpoon" },
				{ "<space>q", group = "Quickfix" },
			})
		end
	}, -- }}}

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "gopls", "templ", "marksman" }
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
}) -- }}}

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

-- Lua

lspconfig.lua_ls.setup {
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

-- Markdown

lspconfig.markdownls.setup {
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

-- Keybindings

-- Go to definitions
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })

-- Go to references
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Go to references" })

-- Preview on "hover"
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover for documentation" })

-- Code action
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { desc = "Code actions" })

-- Show diagnostics
vim.keymap.set('n', '<space>cd', vim.diagnostic.open_float, { desc = "Show diagnostics" })

vim.keymap.set("n", "<c-d>", function()
	vim.diagnostic.setloclist({ open = false }) -- don't open and focus

	local window = vim.api.nvim_get_current_win()

	vim.cmd.lwindow()                 -- open+focus loclist if has entries, else close -- this is the magic toggle command
	vim.api.nvim_set_current_win(window) -- restore focus to window you were editing (delete this if you want to stay in loclist)
end, { desc = "Toggle diagnostics location list" })

-- LSP: Format
vim.keymap.set('n', '<space>cf', function() vim.lsp.buf.format { async = true } end, { desc = "Format current buffer" })

-- Markdown formatting with Prettier
vim.keymap.set("n", "<space>cm", function()
	local file = vim.api.nvim_buf_get_name(0)
	if string.match(file, "%.md$") then
		vim.fn.system("npx prettier --write " .. file)
		vim.cmd("edit")
		print("Markdown formatted with Prettier and file reloaded")
	else
		print("Not a markdown file")
	end
end, { desc = "Format markdown with Prettier" })

-- Telescope: Find Files
vim.keymap.set('n', '<space>ff',
	function() require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git' } }) end,
	{ desc = "Find files" })
vim.keymap.set('n', '<space>fb', require('telescope.builtin').buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<space>fs", '<cmd>Telescope live_grep<CR>', { desc = "Live grep" })

-- Auto Session (Session Manager)
vim.keymap.set('n', '<space>ws', ':SessionSave<CR>', { desc = "Save session" })
vim.keymap.set('n', '<space>wr', ':SessionRestore<CR>', { desc = "Restore session" })

-- Other keymaps

vim.keymap.set('n', '<space>e', ':NvimTreeToggle<CR>', { desc = "Toggle file explorer" })

vim.keymap.set('n', '<space>ft', ":grep -i -e todo: -e note: -e fixme: * | copen 7<CR>",
	{ desc = "Find TODO, NOTE, FIXME" })

--vim.keymap.set('n', '<space>tt', ':tabnew<CR>')
--vim.keymap.set('n', '<space>tc', ':tabclose<CR>')
--vim.keymap.set('n', '<space>tp', ':tabprevious<CR>')
--vim.keymap.set('n', '<space>tn', ':tabnext<CR>')

--vim.keymap.set('n', '<space>bb', '<cmd>:e #<CR>')
--vim.keymap.set('n', '<space>bn', '<cmd>bnext<CR>')
--vim.keymap.set('n', '<space>bp', '<cmd>bprevious<CR>')
--vim.keymap.set('n', '<space>bd', '<cmd>bdelete<CR>')

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate left window" })                                 -- h - Navigate Right
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate down window" })                                 -- j - Navigate Down
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate up window" })                                   -- k - Navigate Up
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Navigate right window" }) -- l - Navigate Left

-- Open quickfix list with linter errors
vim.keymap.set("n", "<space>ql", function()
	vim.diagnostic.setqflist()
	vim.cmd("copen")
end, { desc = "Open quickfix list with linter errors" })
