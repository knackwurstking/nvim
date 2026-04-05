
-- Telescope

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",      -- REQUIRED dependency
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
	{ "<space>a", group = "Agentic" },
	{ "<space>e", group = "Editor" },
	{ "<space>e", group = "Find" },
	{ "<space>s", group = "Session" },
	{ "<space>t", group = "Tabs" },
	{ "<space>w", group = "Window" },
	{ "<space>h", group = "Harpoon" },
	{ "<space>c", group = "Code" },
	{ "<space>cf", group = "Format" },
})

-- Harpoon

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",      -- REQUIRED dependency
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
