-- Telescope

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",                 -- REQUIRED dependency
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim", -- OPTIONAL dependency
	"https://github.com/nvim-telescope/telescope.nvim",
})

-- Treesitter

vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main"
	},
})

require("nvim-treesitter").setup({
	ensure_installed = {
		"typescript",
		"html",
		"css",
		"javascript",
		"svelte",
		"go",
		"gomod",
		"templ",
	},

	-- This is where the highlight config goes
	highlight = {
		enable = true, -- false will disable the whole extension
	},
})

vim.api.nvim_create_autocmd('FileType', {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

-- Oil

vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-mini/mini.icons",
})

require("oil").setup()

-- Agentic

vim.pack.add({ "https://github.com/carlos-algms/agentic.nvim" })

require("agentic").setup({
	-- Providers:
	--   "claude-agent-acp"
	--   "gemini-acp"
	--   "codex-acp"
	--   "opencode-acp"
	--   "cursor-acp"
	--   "copilot-acp"
	--   "auggie-acp"
	--   "mistral-vibe-acp"
	--   "cline-acp"
	--   "goose-acp"
	provider = "mistral-vibe-acp",
})

-- Which

vim.pack.add({ "https://github.com/folke/which-key.nvim" })

require("which-key").setup({
	icons = {
		group = " ", -- This removes the "+" and adds a space instead
	},
	disable = {},
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = true,
			suggestions = 20,
		},
	},
})

require("which-key").add({
	{ "<space>a",  group = "Agentic" },
	{ "<space>e",  group = "Editor" },
	{ "<space>f",  group = "Find" },
	{ "<space>s",  group = "Session" },
	{ "<space>t",  group = "Tabs" },
	{ "<space>w",  group = "Window" },
	{ "<space>h",  group = "Harpoon" },
	{ "<space>c",  group = "Code" },
	{ "<space>cf", group = "Format" },
	{ "<space>g",  group = "Git" },
	{ "<space>b",  group = "Buffer" },
	{ "<space>m",  group = "Makefile Commands" },
})

-- Harpoon

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim", -- REQUIRED dependency
	{
		src = "https://github.com/ThePrimeagen/harpoon",
		version = "harpoon2",
	},
})


require("harpoon").setup()
require("harpoon"):extend(require("harpoon.extensions").builtins.highlight_current_file())

-- Outline

vim.pack.add({ "https://github.com/hedyhli/outline.nvim" })

require("outline").setup({})

-- LazyGit

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim", -- REQUIRED dependency
	"https://github.com/kdheepak/lazygit.nvim"
})

-- Trouble

vim.pack.add({ "https://github.com/folke/trouble.nvim" })

require("trouble").setup()

-- LLM [DISABLED]

-- In your plugins config file (e.g., lua/plugins/llm.lua)
-- INSTAll: `brew install llm`
--vim.pack.add({
--	"https://github.com/nvim-lua/plenary.nvim", -- REQUIRED dependency
--	"https://github.com/huggingface/llm.nvim",
--})
--
--require('llm').setup({
--	backend = "openai",
--	url = "http://192.168.178.52:1234/v1/completions",
--	model = "qwen2.5-coder-7b-instruct-mlx",
--
--	-- Specific tokens for Qwen2.5-Coder
--	tokens_to_clear = { "<|endoftext|>", "<|file_separator|>" },
--
--	fim = {
--		enabled = true,
--		prefix = "<|fim_prefix|>",
--		middle = "<|fim_middle|>",
--		suffix = "<|fim_suffix|>",
--	},
--
--	request_body = {
--		parameters = {
--			max_new_tokens = 30, -- Shorter is faster for ghost text
--			temperature = 0.2, -- A Temperature of 0.2 is less likely to generate unexpected characters
--			top_p = 0.95,
--			stop = { "<|file_separator|>", "<|endoftext|>", "\n\n" },
--		},
--	},
--
--	debounce_ms = 250, -- Increased slightly to prevent "spamming" the local server while typing
--	accept_keymap = "<C-y>",
--	dismiss_keymap = "<C-n>",
--})

-- Theme: Gruvbox
vim.pack.add({ "https://github.com/morhetz/gruvbox" })

vim.cmd("colorscheme gruvbox")

-- Tab Completion: Blink
-- INSTALL: `cd ~/.local/share/nvim/site/pack/core/opt/blink.cmp && cargo build --release`

vim.pack.add({ "https://github.com/saghen/blink.cmp" })

local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	group = group,
	once = true,
	callback = function()
		require("blink.cmp").setup({
			keymap = {
				preset = "super-tab",

				['<C-k>'] = { 'select_prev', 'fallback' },
				['<C-j>'] = { 'select_next', 'fallback' },
				['<C-y>'] = { 'accept', 'fallback' },
			},
			appearance = {
				nerd_font_variant = "mono",
				use_nvim_cmp_as_default = true,
			},
			completion = {
				documentation = { auto_show = false },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		})
	end,
})

-- Git

vim.pack.add({ "https://github.com/nvim-mini/mini.diff" })

require("mini.diff").setup()
