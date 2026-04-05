-- LSP and completion plugins
-- Main LSP configuration

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "lua_ls",
          "gopls",
          "templ",
          "marksman",
          "clangd",
          "ts_ls",
          "tailwindcss",
        }
      },
      dependencies = {
        { "mason-org/mason.nvim", opts = {} },
      },
    },
  },
}
