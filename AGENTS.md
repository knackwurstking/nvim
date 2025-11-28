# AGENTS.md

## Build/Lint/Test Commands
- Lint: `nvim --headless -c "lua require('lint').try_all()" -c "qa!"` (for Lua files)
- Format: `nvim --headless -c "lua require('lint').try_all()" -c "qa!"` (for Lua files)
- Format markdown: `npm run format:md` (using Prettier)

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

## Plugin Ecosystem
This is a Neovim configuration repository with Lua-based plugins using Lazy.nvim plugin manager. Key plugins include:

### Core Functionality
- **Lazy.nvim**: Plugin manager that handles lazy loading of plugins
- **nvim-lspconfig**: Language Server Protocol configuration
- **nvim-treesitter**: Syntax highlighting and parsing for multiple languages (c, lua, vim, vimdoc, query, elixir, heex, javascript, html, go, css)
- **nvim-telescope**: Fuzzy finder for files, buffers, and content
- **nvim-cmp**: Autocompletion engine with multiple sources (LSP, buffer, path, cmdline)
- **lualine.nvim**: Status line with gruvbox theme
- **gruvbox**: Colorscheme with transparent background

### Enhanced UX Features
- **nvim-tree**: File explorer with git integration and custom view settings
- **which-key**: Enhanced keybinding documentation with custom labels
- **auto-session**: Session management to restore previous workspace state
- **outline.nvim**: Code outline view (toggle with <space>o)
- **harpoon**: File navigation shortcuts (mark, navigate, remove files with <space>ha, <space>hn, <space>hp, <space>hr)

### AI Integration
- **avante.nvim**: AI assistant integration (configured for local OpenAI-compatible endpoint)

### Development Tools
- **mason.nvim/mason-lspconfig.nvim**: LSP server management (lua_ls, gopls, templ, marksman)
- **tinygo.nvim**: Support for TinyGo development

## Key Features and Configuration Details
- Uses gruvbox colorscheme with transparent background
- Tree-sitter integration for enhanced syntax highlighting and indentation
- Telescope configured with horizontal layout and custom padding
- Session management using auto-session plugin (suppressed dirs: ~/Downloads, /)
- LSP configuration for Go with gopls and Lua with lua_ls
- Markdown formatting capability using Prettier (npm run format:md)
- Buffer management keybindings (<space>bl, <space>bn, <space>bp, <space>bd, <space>bD, <space>bb)
- Diagnostic and quickfix integration (<space>ql, <C-d>)
- Window navigation keybindings (<C-h>, <C-j>, <C-k>, <C-l>)

## Additional Notes
- This configuration uses a single init.lua file for all Neovim setup
- Keybindings follow leader key pattern (<space> prefix)
- Plugins are configured to load lazily where appropriate
- Uses modern Neovim patterns and Lua best practices for configuration
