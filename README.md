# Neovim Configuration

A modern Neovim configuration with LSP support, AI integration, and extensive plugin ecosystem.

## Features

- **Plugin Management**: Built-in `vim.pack.add()` (no lazy.nvim or packer)
- **LSP**: 11 language servers configured via `vim.lsp.enable()`
- **Completion**: blink.cmp with rust-based fuzzy matching
- **AI Integration**: agentic.nvim for chat, minuet-ai.nvim for inline completion
- **Navigation**: Telescope (fuzzy finder), Harpoon (quick file switching), Oil (file explorer)
- **Git**: Lazygit integration, mini.diff for diff viewing
- **Syntax**: Treesitter with 9 parsers, markdown preview and rendering
- **Theme**: Gruvbox with transparent background
- **Sessions**: Auto-save/load with `.session.vim`

## Quick Install

Run the install script to set up all dependencies:

```bash
bash ~/.config/nvim/install-deps.sh
```

Or install manually:

### Go-based LSPs

```bash
go install golang.org/x/tools/gopls@latest
go install github.com/a-h/templ/cmd/templ@latest
```

### Homebrew Packages (macOS)

```bash
brew install lua-language-server
brew install marksman
brew install llm
```

### npm Packages

```bash
npm install -g @tailwindcss/language-server
npm install -g vscode-langservers-extracted
npm install -g intelephense
```

### Python Packages

```bash
pip3 install autotools-language-server
```

### Blink.cmp Installation

```bash
cd ~/.local/share/nvim/site/pack/core/opt/blink.cmp
cargo build --release
```

### Homebrew Packages (macOS)

```bash
brew install lua-language-server
brew install marksman
brew install llm
# clangd preinstalled on macOS (Xcode CLT), or: brew install llvm
```

### npm Packages

```bash
npm install -g @tailwindcss/language-server
npm install -g vscode-langservers-extracted
npm install -g intelephense
```

### Python Packages

```bash
pip install autotools-language-server
```

### Blink.cmp Installation

```bash
cd ~/.local/share/nvim/site/pack/core/opt/blink.cmp
cargo build --release
```

## Language Server Configuration

| LSP Server | Installation | Language |
|------------|-------------|----------|
| `gopls` | `go install golang.org/x/tools/gopls@latest` | Go |
| `lua_ls` | `brew install lua-language-server` | Lua |
| `templ` | `go install github.com/a-h/templ/cmd/templ@latest` | Templ |
| `tailwindcss` | `npm install -g @tailwindcss/language-server` | Tailwind CSS |
| `marksman` | `brew install marksman` | Markdown |
| `llm_ls` | `brew install llm` | LLM |
| `jsonls` | `npm i -g vscode-langservers-extracted` | JSON |
| `cssls` | `npm i -g vscode-langservers-extracted` | CSS |
| `html` | `npm i -g vscode-langservers-extracted` | HTML |
| `intelephense` | `npm install -g intelephense` | PHP |
| `clangd` | Preinstalled (macOS) or `brew install llvm` | C/C++ |
| `autotools_ls` | `pip3 install autotools-language-server` | Makefile |

### Special LSP Configuration

**HTML Server Settings:**
- Line wrapping disabled (`wrapLineLength = 0`)
- Auto wrap attributes
- Preserves `<pre>` tag content formatting

## Plugins

### AI & Completion

| Plugin | Source | Description |
|--------|--------|-------------|
| **agentic.nvim** | `carlos-algms/agentic.nvim` | AI agent interface (provider: opencode-acp) |
| **blink.cmp** | `saghen/blink.cmp` | Completion with rust-based fuzzy matching |
| **minuet-ai.nvim** | `milanglacier/minuet-ai.nvim` | Inline completion from LM Studio |

### Navigation & Filesystem

| Plugin | Source | Description |
|--------|--------|-------------|
| **harpoon** (v2) | `ThePrimeagen/harpoon` | Quick file navigation |
| **oil.nvim** | `stevearc/oil.nvim` | File explorer |
| **outline.nvim** | `hedyhli/outline.nvim` | Code outline/symbols |
| **telescope.nvim** | `nvim-telescope/telescope.nvim` | Fuzzy finder |
| **telescope-fzf-native.nvim** | `nvim-telescope/telescope-fzf-native.nvim` | FZF native sorter |
| **telescope-ui-select.nvim** | `nvim-telescope/telescope-ui-select.nvim` | UI select extension |
| **plenary.nvim** | `nvim-lua/plenary.nvim` | Dependency for Telescope |

### Git

| Plugin | Source | Description |
|--------|--------|-------------|
| **lazygit.nvim** | `kdheepak/lazygit.nvim` | Lazygit integration |
| **mini.diff** | `nvim-mini/mini.diff` | Git diff visualization |

### Diagnostics & UI

| Plugin | Source | Description |
|--------|--------|-------------|
| **trouble.nvim** | `folke/trouble.nvim` | Diagnostics UI |
| **gruvbox.nvim** | `ellisonleao/gruvbox.nvim` | Gruvbox colorscheme |
| **mini.icons** | `nvim-mini/mini.icons` | Icons for UI elements |
| **which-key.nvim** | `folke/which-key.nvim` | Keybinding helper |

### Syntax & Highlighting

| Plugin | Source | Description |
|--------|--------|-------------|
| **nvim-treesitter** | `nvim-treesitter/nvim-treesitter` | Syntax highlighting |
| **markdown-preview.nvim** | `iamcco/markdown-preview.nvim` | Markdown preview in browser |
| **render-markdown.nvim** | `MeanderingProgrammer/render-markdown.nvim` | Markdown rendering |

### Treesitter Parsers

`typescript`, `html`, `css`, `javascript`, `svelte`, `go`, `gomod`, `templ`, `php`

## Keymaps

Leader key: `<space>`

### Agentic AI (`<space>a`)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-\>` | n, v, i | Toggle Agentic Chat |
| `<C-'>` | n, v | Add selection/file to context |
| `<space>an` | n | New session |
| `<space>ar` | n | Restore session |
| `<space>ad` | n | Add line diagnostics |
| `<space>aD` | n | Add all buffer diagnostics |

### Harpoon (`<space>h`)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<space>hh` | n | Toggle menu |
| `<space>ha` | n | Add file |
| `<space>hr` | n | Remove file |
| `<space>hn` | n | Next file |
| `<space>hp` | n | Previous file |

### Explorer (`<space>e`)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<space>ee` | n | Open parent directory (Oil) |
| `<space>er` | n | Open root directory (Oil) |

### Telescope (`<space>f`)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<space>ff` | n | Find files |
| `<space>fb` | n | Find buffers |
| `<space>fs` | n | Live grep |

### Window Management (`<space>w`)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<space>ww` | n | Split to new tab |
| `<space>ws` | n | Vertical split |
| `<space>wv` | n | Horizontal split |
| `<space>q` | n | Close (wq) |
| `<C-h>` | n | Navigate left |
| `<C-j>` | n | Navigate down |
| `<C-k>` | n | Navigate up |
| `<C-l>` | n | Navigate right |

### Tab Management (`<space>t`)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<space>tt` | n | New tab |
| `<space>tc` | n | Close tab |
| `<space>tp` | n | Previous tab |
| `<space>tn` | n | Next tab |

### Session (`<space>s`)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<space>ss` | n | Save session |
| `<space>sl` | n | Load session |

*Auto-loads `.session.vim` on startup if no arguments provided*

### Buffer (`<space>b`)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<space>bn` | n | Next buffer |
| `<space>bp` | n | Previous buffer |
| `<space>bd` | n | Delete buffer |
| `<space>bD` | n | Delete all except current |
| `<space>bb` | n | Switch to last buffer |

### LSP & Code (`<space>c`)

| Keymap | Mode | Description |
|--------|------|-------------|
| `gd` | n | Go to definition |
| `gr` | n | Go to references |
| `K` | n | Hover documentation |
| `<space>ca` | n | Code actions |
| `<space>cd` | n | Show diagnostics |
| `<space>cf` | n | Format buffer |
| `<space>cx` | n | Toggle diagnostics (Trouble) |
| `<space>cX` | n | Toggle buffer diagnostics |
| `<space>cc` | n | Toggle Clangd debug |

### Git (`<space>g`)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<space>gg` | n | Open Lazygit |

### Markdown

| Keymap | Mode | Description |
|--------|------|-------------|
| `<space>mp` | n | Start preview |
| `<space>ms` | n | Stop preview |
| `<space>cfm` | n | Format with Prettier |

### Makefile (`<space>m`)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<space>m<key>` | n | Run Makefile target |

### Other

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>o` | n | Toggle Outline |
| `<M-j>` (Alt+j) | n | Next quickfix |
| `<M-k>` (Alt+k) | n | Previous quickfix |

## Settings

### Indentation
- Tab size: 4
- Shift width: 4
- Expand tab: false (uses tabs)

### Display
- Line numbers: absolute + relative
- Cursor line: enabled
- Color column: 80 and 120
- Tab shows as `→ `, space as `·`

### Spell Check
- Languages: `en_us`, `de_de`
- Enabled by default

### Session Options
Saves: buffers, curdir, folds, help, tabpages, winsize, winpos, terminal, localoptions, globals

### Theme (Gruvbox)
- Transparent mode: enabled
- Italic: strings, comments, emphasis, folds
- Inverse: enabled
- Underline, bold, undercurl: enabled

## Notes

- Use Homebrew for macOS-specific packages
- Use Go installation for Golang tools
- Use npm global install for JavaScript/TypeScript servers
- Plugin lockfile: `nvim-pack-lock.json`
