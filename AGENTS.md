# Neovim Configuration

## Structure
- `init.lua` -> `lua/init.lua` -> loads options, lsp, plugins, keymaps
- `lua/.plugins/` -> organized plugin configs (core, lsp, git, etc.)
- `lua/keymaps/` -> keybinding modules
- `nvim-pack-lock.json` -> pins all plugin revisions

## Plugin Management
Uses built-in `vim.pack.add()` (not lazy/packer). Lockfile is `nvim-pack-lock.json`.

## External Dependencies

### Go
```bash
go install golang.org/x/tools/gopls@latest
go install github.com/a-h/templ/cmd/templ@latest
```

### Homebrew
```bash
brew install lua-language-server marksman llm
```

### npm
```bash
npm install -g @tailwindcss/language-server vscode-langservers-extracted
```

### Blink.cmp (completion)
```bash
cd ~/.local/share/nvim/site/pack/core/opt/blink.cmp && cargo build --release
```

## Key Settings
- Leader key: `<space>`
- Tab size: 4, no expandtab
- Spell: `en_us`, `de_de`
- Theme: gruvbox

## AI Integration
- `agentic.nvim`: main agent interface (provider: opencode-acp)
- `minuet-ai.nvim`: inline completion from LM Studio at `http://192.168.178.52:1234`
