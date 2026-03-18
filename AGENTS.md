# AGENTS.md

## Project Overview
- **Purpose**: Neovim configuration with Lua-based plugins for enhanced productivity and development workflow
- **Architecture**: Modular structure in `lua/` directory with lazy-loaded plugins managed by Lazy.nvim
- **Dependencies**: Minimal external dependencies; relies on Neovim's Lua APIs and plugin ecosystem

## Build/Lint/Test Commands

- **Lint**: `nvim --headless -c "lua require('lint').try_all()" -c "qa!"`
- **Format**: `nvim --headless -c "lua require('lint').try_all()" -c "qa!"`
- **Format markdown**: `npm run format:md`
- **Format all files**: `npm run format`

## Code Style Guidelines

### Lua Conventions
- Use **snake_case** for variables, functions, and module names
- Use **PascalCase** for plugin names (e.g., `nvim-telescope`)
- Indentation: **4 spaces** (configured via `vim.o.tabstop = 4`, `vim.opt.shiftwidth = 4`)
- Use `vim.o` for options and `vim.opt` for lists/tables
- Prefer `require()` over `pcall(require)` for dependencies
- Use descriptive variable and function names

### File Structure & Imports
- Organize plugins in `lua/plugins/<category>/<plugin_name>.lua`
- Load core modules first: options → plugins → keymaps → LSP
- Plugin configuration uses `return { ... }` table with keys: `dependencies`, `event`, `lazy`, `opts`, `config`
- Keymaps use `vim.keymap.set()` with `{ desc = "..." }` for documentation
- Use `require("module.name")` for importing modules

### Naming Conventions
- Plugin tables use PascalCase: `MyPlugin`
- Options use snake_case: `options.lua`, `opt.number = true`
- Keymap files organized by category: `keymaps/<category>.lua`

### Error Handling
- Minimal explicit error handling; relies on Neovim's built-in error reporting
- Use `vim.notify()` for explicit notifications with levels: `vim.log.levels.ERROR`
- Plugin loader uses `pcall(require, ...)` for safe loading with error notifications

## Imports/Formatting
- No external Lua dependencies beyond standard Neovim APIs and plugins listed below
- Plugin loading via Lazy.nvim; order matters for dependencies (see `core/plugins.lua`)
- Format markdown with Prettier: `npm run format:md`
- Format all files: `npm run format`

## Plugin Ecosystem

### Core Functionality
- **Lazy.nvim**: Plugin manager with lazy loading
- **nvim-lspconfig**: LSP server configurations
- **nvim-treesitter**: Syntax highlighting (c, lua, vim, markdown, go, templ, css, html, etc.)
- **nvim-telescope**: Fuzzy finder with horizontal layout
- **blink.cmp**: Enhanced completion with signature help
- **lualine.nvim**: Status line
- **gruvbox**: Colorscheme with transparent background

### Enhanced UX Features
- **which-key.nvim**: Keybinding documentation and grouping
- **oil.nvim**: File explorer
- **auto-session**: Session persistence (suppresses: `~/Downloads`, `/`)
- **outline.nvim**: Code outline view (`<space>o`)
- **harpoon**: File navigation shortcuts

### AI Integration
- **avante.nvim**: AI assistant (configured for LM Studio at `192.168.178.52:1234`)
- **copilot.vim**: GitHub Copilot integration

### Development Tools
- **mason.nvim/mason-lspconfig.nvim**: LSP server management (lua_ls, gopls, templ, marksman, clangd, ts_ls)
- **conform.nvim**: Code formatting (templ, gofmt, goimports)
- **tinygo.nvim**: TinyGo support
- **plenary.nvim**: Core dependency for many plugins

## Key Features and Configuration Details
- Transparent gruvbox background (` transparency = true`)
- Tree-sitter for syntax highlighting and indentation
- Telescope configured with horizontal layout, bottom prompt
- LSP servers: Go (gopls), Lua (lua_ls), Templ (templ), HTML/TS/JS (ts_ls)
- Fast keymap leader set to `<space>`
- Session recovery suppressed in home directories
- Blink CMP with signature help enabled
- Multi-cursor support via `vim-visual-multi`

## Commit Message Guidelines
- Format: type(scope): description (≤72 chars)
- Types: feat, fix, docs, style, refactor, perf, test, chore, revert
- Example: `chore: update avante.nvim provider model to gpt-oss`

## Cursor/Copilot Rules
No specific Cursor or Copilot rules defined. Use standard Neovim plugin conventions.
