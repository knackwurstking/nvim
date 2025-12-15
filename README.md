# Neovim Configuration - Refactored Structure

## Overview

This Neovim configuration has been refactored for better organization, maintainability, and clarity. The configuration is now structured in a modular, hierarchical manner with clear separation of concerns.

## Directory Structure

```
lua/
└── core/
    ├── init.lua              # Main entry point, loads all modules
    ├── options.lua           # General Neovim options and settings
    ├── plugins.lua           # Plugin manager configuration with organized groups
    ├── lsp.lua               # LSP server configurations
    └── keymaps/
        ├── init.lua           # Loads all keymap modules
        ├── ai.lua             # AI-related keymaps (Avante)
        ├── buffer.lua         # Buffer management
        ├── code.lua           # Code actions and formatting
        ├── explorer.lua       # File exploration (oil.nvim)
        ├── git.lua            # Git operations
        ├── harpoon.lua        # Harpoon file navigation
        ├── lsp.lua            # LSP keybindings
        ├── markdown.lua       # Markdown-specific operations
        ├── navigation.lua     # Window and split navigation
        ├── quickfix.lua       # Quickfix list navigation
        ├── telescope.lua      # Telescope fuzzy finder
        ├── trouble.lua        # Trouble diagnostics
        └── window.lua         # Window management and tabs
```

## Key Improvements

### 1. Modular Organization
- **Plugins**: Organized by functionality (UI, navigation, LSP, etc.)
- **Keymaps**: Grouped by category for easier maintenance
- **Options**: Centralized configuration for Neovim settings
- **LSP**: Dedicated file for language server configurations

### 2. Better Load Order
The configuration loads in this order:
1. Set leader keys
2. Load core options
3. Initialize plugin manager
4. Load plugins
5. Load keymaps
6. Configure LSP

### 3. Enhanced Documentation
- Each file has clear comments explaining its purpose
- Keymaps include descriptive help text
- Plugin configurations are well-commented

### 4. Consistent Naming
- All keybindings use consistent naming conventions
- Plugin configurations follow standard patterns
- Files are named descriptively

## Plugin Groups

### Core Dependencies
- `plenary.nvim` - Lua functions for Neovim

### UI and Appearance
- `gruvbox` - Colorscheme with transparent background
- `lualine.nvim` - Status line

### File Navigation
- `telescope.nvim` - Fuzzy finder
- `oil.nvim` - File explorer

### LSP and Completion
- `nvim-lspconfig` - LSP support
- `mason.nvim` - LSP server manager
- `nvim-cmp` - Autocompletion engine
- `blink.cmp` - Enhanced completion
- `conform.nvim` - Code formatting

### Syntax Highlighting
- `nvim-treesitter` - Parser and highlighting

### Git Integration
- `gitsigns.nvim` - Git signs in gutter
- `lazygit.nvim` - Git client

### File Management
- `harpoon` - Quick file navigation
- `outline.nvim` - Code outline

### Diagnostics
- `trouble.nvim` - Diagnostic viewer

### AI Integration
- `avante.nvim` - AI assistant
- `copilot.vim` - GitHub Copilot

### Specialized Tools
- `tinygo.nvim` - TinyGo support

### Utility
- `which-key.nvim` - Keybinding documentation

## Keybindings Summary

### Leader Key: Space

#### Explorer (`<space>e`)
- `<space>ee` - Open parent directory (oil.nvim)
- `<space>er` - Open root directory (oil.nvim)

#### Files (`<space>f`)
- `<space>ff` - Find files (Telescope)
- `<space>fb` - Find buffers (Telescope)
- `<space>fs` - Live grep (Telescope)
- `<space>fh` - Harpoon files (Telescope)

#### Code (`<space>c`)
- `<space>ca` - Code actions (LSP)
- `<space>cd` - Show diagnostics (LSP)
- `<space>cf` - Format buffer (LSP)
- `<space>cm` - Format markdown
- `<space>cc` - Clangd debug info

#### Buffers (`<space>b`)
- `<space>bn` - Next buffer
- `<space>bp` - Previous buffer
- `<space>bd` - Delete buffer
- `<space>bD` - Delete all buffers except current
- `<space>bb` - Switch to last buffer

#### Window (`<space>w`)
- `<leader>ws` - Vertical split
- `<leader>wv` - Horizontal split
- `<leader>ww` - Split into new tab
- `<leader>q` - Save and quit
- `<leader>tt` - New tab
- `<leader>tc` - Close tab
- `<leader>tp` - Previous tab
- `<leader>tn` - Next tab

#### Harpoon (`<space>h`)
- `<space>hh` - Toggle harpoon menu
- `<C-e>` - Toggle harpoon menu
- `<space>ha` - Add file to harpoon
- `<space>hr` - Remove file from harpoon
- `<space>hn` - Next harpoon file
- `<space>hp` - Previous harpoon file

#### Avante AI (`<space>a`)
- `<space>ac` - Open Avante chat
- `<space>an` - Open new Avante chat
- `<space>ai` - Insert with Avante
- `<space>ar` - Replace with Avante
- `<space>as` - Summarize with Avante
- `<space>at` - Toggle Avante
- `<C-Enter>` (visual) - Avante edit
- `<space>as` (visual) - Stop Avante

#### Trouble (`<space>x`)
- `<leader>xx` - Toggle diagnostics
- `<leader>xX` - Toggle buffer diagnostics
- `<leader>cl` - Toggle LSP definitions

#### Session (`<space>s`)
- `<space>ss` - Save session
- `<space>sl` - Load session

#### Navigation (Ctrl)
- `<C-h>` - Move left
- `<C-j>` - Move down
- `<C-k>` - Move up
- `<C-l>` - Move right

#### LSP
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation

#### Git
- `<space>gg` - Open Lazygit
- `]c` - Next git hunk
- `[c` - Previous git hunk

#### Quickfix
- `<M-j>` - Next quickfix item
- `<M-k>` - Previous quickfix item

## Configuration Management

### Installing Plugins
Plugins are managed by `lazy.nvim`. Run `:Lazy` to open the plugin manager.

### Updating Plugins
Run `:Lazy update` to update all plugins.

### Checking for Updates
Run `:Lazy check` to check for plugin updates.

## Customization

To customize the configuration:

1. **Add new plugins**: Edit `lua/core/plugins.lua`
2. **Add keybindings**: Edit the appropriate file in `lua/core/keymaps/`
3. **Change options**: Edit `lua/core/options.lua`
4. **Configure LSP**: Edit `lua/core/lsp.lua`

## Migration Notes

This refactored configuration maintains all the functionality of the original but with improved organization. The keybindings and plugin configurations remain the same, just better organized.

## Troubleshooting

If you encounter issues:

1. Check `:messages` for error messages
2. Run `:Lazy sync` to ensure all plugins are properly loaded
3. Verify that all dependencies are installed (e.g., `rg`, `gopls`, etc.)

## License

This configuration is provided as-is. Feel free to modify and adapt it to your needs.
