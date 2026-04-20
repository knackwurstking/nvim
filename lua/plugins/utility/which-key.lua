vim.pack.add({ "https://github.com/folke/which-key.nvim" })

require("which-key").setup({
	icons = {
		group = " ",
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
