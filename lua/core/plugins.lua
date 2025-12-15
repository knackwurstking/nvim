-- Plugin manager configuration
-- Uses lazy.nvim for lazy-loading plugins
-- Dynamically loads plugins from the plugins directory structure

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

-- Helper function to load plugins from a directory
local function load_plugins_from_dir(dir)
	local plugins = {}
	local home = os.getenv("HOME")
	local path = string.format(home .. "/.config/nvim/lua/plugins/%s/*.lua", dir)

	for _, plugin_file in ipairs(vim.fn.glob(path, true, true)) do
		local plugin_name = vim.fn.fnamemodify(plugin_file, ":t:r")
		local ok, plugin_table = pcall(require, string.format("plugins.%s.%s", dir, plugin_name))

		if ok and type(plugin_table) == "table" then
			table.insert(plugins, plugin_table)
		else
			vim.notify(string.format("Failed to load plugin: %s", plugin_file), vim.log.levels.ERROR)
		end
	end

	return plugins
end

-- Load plugins from all directories
local plugins = {}

-- Load in dependency order: core first, then others
for _, dir in ipairs({
	"core",
	"ui",
	"navigation",
	"lsp",
	"syntax",
	"git",
	"filesystem",
	"diagnostics",
	"ai",
	"specialized",
	"utility"
}) do
	local dir_plugins = load_plugins_from_dir(dir)
	for _, plugin in ipairs(dir_plugins) do
		table.insert(plugins, plugin)
	end
end

-- Setup lazy.nvim
require("lazy").setup(plugins, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
