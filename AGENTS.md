# AGENTS.md

## Build/Lint/Test Commands
- Lint: `nvim --headless -c "lua require('lint').try_all()" -c "qa!"` (for Lua files)
- No specific test commands found
- Format: `nvim --headless -c "lua require('lint').try_all()" -c "qa!"` (for Lua files)

## Code Style Guidelines
- Lua code style follows standard Neovim plugin conventions
- Use 4-space indentation (vim.o.tabstop = 4, vim.o.shiftwidth = 4)
- Follow Neovim's Lua plugin best practices
- Use `vim.o` for options instead of `vim.opt`
- Prefer `require()` over `pcall(require)` for dependencies
- Use descriptive variable names
- All code is in a single init.lua file with proper commenting

## Imports/Formatting
- No external dependencies beyond standard Neovim Lua APIs
- Follow Neovim's tree-sitter and LSP configuration patterns
- Use `require("plugin")` for plugins
- Use `vim.keymap.set()` for keybindings
- All configuration in a single init.lua file

## Naming Conventions
- Use snake_case for variables and functions
- Use PascalCase for plugin names
- Prefix plugin configurations with `require("plugin").setup()`

## Error Handling
- No explicit error handling patterns found in the codebase
- Relies on Neovim's built-in error reporting

## Additional Notes
- This is a Neovim configuration repository with Lua-based plugins
- Uses Lazy.nvim plugin manager
- LSP configuration for golang with gopls
- Tree-sitter integration
- Telescope for fuzzy finding
- Various UI enhancements and keybindings
- nvim-tree plugin added with toggle functionality on leader+e
- which-key plugin for enhanced keybinding documentation
- gruvbox colorscheme with transparent background