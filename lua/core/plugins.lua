-- Plugin manager configuration
-- Uses lazy.nvim for lazy-loading plugins

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Organize plugins by category
local plugins = {
  -- Core dependencies
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  -- UI and appearance
  {
    "morhetz/gruvbox",
    config = function()
      vim.cmd("colorscheme gruvbox")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          theme = "gruvbox",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            {
              "filename",
              path = 1,
            }
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {}
        },
      })
    end,
  },

  -- File navigation and exploration
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      manual_mode = true,
      patterns = { ".git" },
      detection_methods = { "patterns", "lsp" },
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            width = { padding = 0 },
            height = { padding = 0 },
            preview_width = 0.6,
          },
        },
        sorting_strategy = "ascending",
      },
    },
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
  },

  -- LSP and completion
  {
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
          }
        },
        dependencies = {
          { "mason-org/mason.nvim", opts = {} },
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup {
        mapping = cmp.mapping.preset.insert {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm { select = true },
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-y>"] = cmp.mapping.confirm { select = true },
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "cmp_nvim_lsp_signature_help" },
          { name = "buffer" },
          { name = "path" },
          { name = "cmdline" },
        },
      }
    end,
  },
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    opts = {
      keymap = { preset = "default" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      signature = { enabled = true },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        templ = { "templ", "goimports" },
        go = { "gofmt", "goimports" },
        html = {},
      },
    },
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "elixir",
          "heex",
          "javascript",
          "go",
          "css",
          "templ",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require("gitsigns").setup {
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signs_staged = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
          map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, { expr = true })
          map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, { expr = true })
        end,
      }
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- File navigation and management
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup({})
    end,
  },

  -- Code outline
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<space>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      outline_window = {
        width = 40,
        auto_close = true,
      },
    },
  },

  -- Diagnostics and trouble
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        symbols = {
          position = "right",
          width = 40,
        },
      },
    },
    cmd = "Trouble",
  },

  -- AI integration
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-mini/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "stevearc/dressing.nvim",
      "folke/snacks.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    config = function()
      require("avante").setup({
        windows = {
          position = "right",
          width = 45,
        },
        provider = "openai",
        providers = {
          openai = {
            endpoint = "http://192.168.178.52:11434/v1",
            model = "devstral-small-2:latest",
            api_key = "",
          },
        },
      })
    end,
  },
  {
    "github/copilot.vim",
  },

  -- Specialized tools
  {
    "pcolladosoto/tinygo.nvim",
    opts = {},
  },

  -- Keybinding documentation
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        icons = {
          group = " ", -- This removes the "+" and adds a space instead
        },
        disable = {},
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
        },
      })
      wk.add({
        { "<space>e", group = "Explorer" },
        { "<space>f", group = "Files" },
        { "<space>c", group = "Code" },
        { "<space>b", group = "Buffers" },
        { "<space>w", group = "Window" },
        { "<space>h", group = "Harpoon" },
        { "<space>a", group = "Avante" },
        { "<space>x", group = "Trouble" },
        { "<space>s", group = "Session" },
        { "<space>t", group = "Tab Management" },
      })
    end,
  },
}

-- Setup lazy.nvim
require("lazy").setup(plugins, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})