# Neovim Configuration

## Structure
- `init.lua` -> `lua/init.lua` -> loads options, lsp, plugins, keymaps
- `lua/plugins/` -> organized plugin configs (diagnostics, ui, git, etc.)
- `lua/keymaps/` -> keybinding modules
- `nvim-pack-lock.json` -> pins all plugin revisions

## Plugin Management
Uses built-in `vim.pack.add()` (not lazy/packer). Lockfile is `nvim-pack-lock.json`.

## External Dependencies

### Quick Install
```bash
bash ~/.config/nvim/install-deps.sh
```

### Go
```bash
go install golang.org/x/tools/gopls@latest
go install github.com/a-h/templ/cmd/templ@latest
```

### Homebrew
```bash
brew install lua-language-server marksman llm
# clangd preinstalled on macOS (Xcode CLT), or: brew install llvm
```

### npm
```bash
npm install -g @tailwindcss/language-server vscode-langservers-extracted intelephense pyright typescript-language-server
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

## LSP Servers
- `gopls` (Go), `lua_ls` (Lua), `templ` (Templ)
- `tailwindcss` (Tailwind), `jsonls` (JSON), `cssls` (CSS), `html` (HTML)
- `marksman` (Markdown), `llm_ls` (LLM), `intelephense` (PHP)
- `clangd` (C/C++), `pyright` (Python), `ts_ls` (JavaScript / TypeScript)

## Markdown Code Blocks
Markdown code block highlighting uses `markdown` + `markdown_inline` Treesitter parsers with language injection via `vim.treesitter.language.register()`. Common code fence languages (`py`, `js`, `ts`, `sh`, `yml`, etc.) are registered for auto-highlighting.

## AI Integration
- `opencode.nvim`: main agent interface — shared sessions mit OpenCode CLI (`<leader>o` Prefix, `<C-s>` Submit)
- `minuet-ai.nvim`: inline completion from LM Studio at `http://192.168.178.52:1234`
