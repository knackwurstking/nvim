# Dependencies Installation Guide

## Tools Required

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
```

## Blink.cmp Installation

```bash
cd ~/.local/share/nvim/site/pack/core/opt/blink.cmp;
cargo build --release
```

## Notes

- Use Homebrew for macOS-specific packages
- Use Go installation for Golang tools
- Use npm global install for JavaScript/TypeScript servers
