-- Telescope

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim", -- REQUIRED dependency
	{
		src = "https://github.com/nvim-telescope/telescope.nvim",
		version = "main",
	}
})

-- Treesitter

vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main"
	},
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
	-- Any ACP-compatible provider works. Built-in: "claude-agent-acp" | "gemini-acp" | "codex-acp" | "opencode-acp" | "cursor-acp" | "copilot-acp" | "auggie-acp" | "mistral-vibe-acp" | "cline-acp" | "goose-acp"
	provider = "opencode-acp",
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
--
--require('llm').setup({
--	backend = "openai", -- LM Studio uses an OpenAI-compatible API
--	url = "http://192.168.178.52:1234/v1/completions",
--	model = "",       -- Replace with the model currently loaded in LM Studio
--	tokens_to_clear = { "<|endoftext|>" },
--	request_body = {
--		parameters = {
--			max_new_tokens = 60,
--			temperature = 0.2,
--			top_p = 0.95,
--		},
--	},
--	-- Configure FIM (Fill-In-the-Middle) for ghost-text completion
--	fim = {
--		enabled = true,
--		prefix = "<fim_prefix>",
--		middle = "<fim_middle>",
--		suffix = "<fim_suffix>",
--	},
--	debounce_ms = 150,
--	accept_keymap = "<C-Y>", -- Alt+L to accept suggestion
--	dismiss_keymap = "<C-n>",
--})
