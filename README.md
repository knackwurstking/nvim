# Neovim Configuration

A modern, modular Neovim configuration with Lua-based plugins and.lazy loading.

## Features

- **Modular structure** organized by functionality
- **Lazy.nvim** for efficient plugin loading
- **LSP support** with Mason for server management
- **Treesitter** for syntax highlighting (20+ languages)
- **Completion** with Blink CMP and signature help
- **AI integration** with Avante (LM Studio) and Copilot
- **Git workflows** with Lazygit and Gitsigns

## Prerequisites

- Neovim ≥ 0.9
- Git
- [Hybrid](https://github.com/neovim/neovim/releases/tag/v0.9.0) (for truecolor)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (Telescope search)
- [lazygit](https://github.com/jesseduffield/lazygit) (Git UI)

### Install Dependencies

**macOS:**
```bash
brew install neovim git ripgrep lazygit
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt install neovim git ripgrep
```

**Windows (Chocolatey):**
```powershell
choco install neovim git ripgrep
```

## Installation

1. Backup existing config:
   ```bash
   mv ~/.config/nvim{,.bak}
   ```

2. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/nvim.git ~/.config/nvim
   ```

3. Open Neovim and run `:Lazy sync` to install plugins

## Plugin Commands

| Command | Description |
|---------|-------------|
| `:Lazy` | Open plugin manager |
| `:Lazy sync` | Install/update plugins |
| `:Lazy update` | Update all plugins |

## LSP Servers

The configuration automatically manages these servers via Mason:

- `lua_ls` - Lua
- `gopls` - Go
- `templ` - Templ
- `marksman` - Markdown
- `clangd` - C/C++
- `ts_ls` - TypeScript/JavaScript

## Keybindings (Leader: Space)

| Map | Action |
|-----|--------|
| `ff` | Find files |
| `fb` | Find buffers |
| `fs` | Live grep |
| `bn/bp` | Next/prev buffer |
| `bd` | Delete buffer |
| `<C-h/j/k/l>` | Window navigation |
| `gh` | Harpoon menu |
| `ha/hn/hp/hr` | Harpoon add/nav |
| `ac/an/ai/ar/as` | Avante AI actions |
| `xx/xX/cl` | Trouble diagnostics |

See [AGENTS.md](./AGENTS.md) for complete keybinding reference.

## Customization

- Add plugins: edit `lua/core/plugins.lua`
- Add keymaps: edit `lua/core/keymaps/<category>.lua`
- Change options: edit `lua/core/options.lua`

## Troubleshooting

1. Check `:messages` for errors
2. Run `:Lazy sync` to resolve plugin issues
3. Verify dependencies are installed (`rg`, `lazygit`, etc.)

## License

MIT
