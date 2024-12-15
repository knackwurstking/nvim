--if true then return {} end

local HOME = os.getenv("HOME")

return {
    -- add gruvbox
    { -- "ellisonleao/gruvbox.nvim"
        "ellisonleao/gruvbox.nvim",
        opts = {
            transparent_mode = true,
        },
    },

    -- Configure LazyVim to load gruvbox
    { -- "LazyVim/LazyVim"
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox",
        },
    },

    { -- "folke/trouble.nvim"
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },

    -- disable trouble
    --{ "folke/trouble.nvim", enabled = false },

    -- override nvim-cmp and add cmp-emoji
    { -- "hrsh7th/nvim-cmp"
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-emoji" },
        ---@diagnostic disable-next-line: undefined-doc-name
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            table.insert(opts.sources, { name = "emoji" })
        end,
    },

    -- change some telescope options and a keymap to browse plugin files
    { -- "nvim-telescope/telescope.nvim"
        "nvim-telescope/telescope.nvim",
        keys = {
        -- add a keymap to browse plugin files
        -- stylua: ignore
        {
            "<leader>fp",
            function()
                require("telescope.builtin").find_files({
                    cwd = require("lazy.core.config").options.root
                })
            end,
            desc = "Find Plugin File",
        },
        },
        -- change some options
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
            },
        },
    },

    -- add pyright to lspconfig
    { -- "neovim/nvim-lspconfig"
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        dependencies = {
            "jose-elias-alvarez/typescript.nvim",
            init = function()
                require("lazyvim.util").lsp.on_attach(function(_, buffer)
                    vim.keymap.set(
                        "n",
                        "<leader>co",
                        "TypescriptOrganizeImports",
                        { buffer = buffer, desc = "Organize Imports" }
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>cR",
                        "TypescriptRenameFile",
                        { desc = "Rename File", buffer = buffer }
                    )
                end)
            end,
        },
        opts = {
            ---@diagnostic disable-next-line: undefined-doc-name
            ---@type lspconfig.options
            servers = {
                -- pyright will be automatically installed with mason and loaded with lspconfig
                pyright = {},

                -- tsserver will be automatically installed with mason and loaded with lspconfig
                tsserver = {},

                marksman = {},
            },

            inlay_hints = { enabled = false },

            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@diagnostic disable-next-line: undefined-doc-name
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with typescript.nvim
                tsserver = function(_, opts)
                    require("typescript").setup({
                        server = opts,
                    })

                    return true
                end,

                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        },
    },

    -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
    -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
    { -- "lazyvim.plugins.extras.lang.typescript"
        import = "lazyvim.plugins.extras.lang.typescript",
    },

    -- add more treesitter parsers
    { -- "nvim-treesitter/nvim-treesitter"
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
        },
    },

    -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
    -- would overwrite `ensure_installed` with the new value.
    -- If you'd rather extend the default config, use the code below instead:
    { -- "nvim-treesitter/nvim-treesitter"
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            -- add tsx and treesitter
            vim.list_extend(opts.ensure_installed, {
                "tsx",
                "typescript",
            })
        end,
    },

    -- the opts function can also be used to change the default opts:
    { -- "nvim-lualine/lualine.nvim"
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            table.insert(opts.sections.lualine_x, "😄")
        end,
    },

    -- or you can return new options to override all the defaults
    { -- "nvim-lualine/lualine.nvim"
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function()
            return {
                --[[add your custom lualine config here]]
            }
        end,
    },

    -- use mini.starter instead of alpha
    { -- "lazyvim.plugins.extras.ui.mini-starter"
        import = "lazyvim.plugins.extras.ui.mini-starter",
    },

    -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
    { -- "lazyvim.plugins.extras.lang.json"
        import = "lazyvim.plugins.extras.lang.json",
    },

    { -- "williamboman/mason.nvim"
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
                "flake8",
                "markdownlint-cli2",
                "markdown-toc",
            },
        },
    },

    { -- "iamcco/markdown-preview.nvim"
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },

        build = function()
            require("lazy").load({ plugins = { "markdown-preview.nvim" } })
            vim.fn["mkdp#util#install"]()
        end,

        keys = {
            {
                "<leader>cp",
                ft = "markdown",
                "<cmd>MarkdownPreviewToggle<cr>",
                desc = "Markdown Preview",
            },
        },

        config = function()
            vim.cmd([[do FileType]])
        end,
    },

    { -- "stevearc/conform.nvim"
        "stevearc/conform.nvim",
        opts = {
            formatters = {
                ["markdown-toc"] = {
                    condition = function(_, ctx)
                        for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
                            if line:find("<!%-%- toc %-%->") then
                                return true
                            end
                        end
                    end,
                },
                ["markdownlint-cli2"] = {
                    condition = function(_, ctx)
                        local diag = vim.tbl_filter(function(d)
                            return d.source == "markdownlint"
                        end, vim.diagnostic.get(ctx.buf))
                        return #diag > 0
                    end,
                },
                ["prettier"] = {
                    prepend_args = {
                        "--print-width",
                        "100",
                        "--tab-width",
                        "4",
                    },
                },
            },

            formatters_by_ft = {
                ["templ"] = { "templ" },
                ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
                ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
            },
        },
    },

    { -- "mfussenegger/nvim-lint"
        "mfussenegger/nvim-lint",
        optional = true,
        opts = {
            linters = {
                ["markdownlint-cli2"] = {
                    args = { "--config", HOME .. "/.config/nvim/.markdownlint-cli2.yaml", "--" },
                },
            },
            linters_by_ft = {
                markdown = { "markdownlint-cli2" },
            },
        },
    },

    { -- "nvimtools/none-ls.nvim"
        "nvimtools/none-ls.nvim",
        optional = true,
        opts = function(_, opts)
            local nls = require("null-ls")
            opts.sources = vim.list_extend(opts.sources or {}, {
                nls.builtins.diagnostics.markdownlint_cli2,
            })
        end,
    },

    { -- "echasnovski/mini.hipatterns"
        "echasnovski/mini.hipatterns",
        recommended = true,
        desc = "Highlight colors in your code. Also includes Tailwind CSS support.",
        event = "LazyFile",
        opts = function()
            local hi = require("mini.hipatterns")
            return {
                -- custom LazyVim option to enable the tailwind integration
                tailwind = {
                    enabled = true,
                    ft = {
                        "astro",
                        "css",
                        "heex",
                        "html",
                        "html-eex",
                        "javascript",
                        "javascriptreact",
                        "rust",
                        "svelte",
                        "typescript",
                        "typescriptreact",
                        "vue",
                    },
                    -- full: the whole css class will be highlighted
                    -- compact: only the color will be highlighted
                    style = "full",
                },
                highlighters = {
                    hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
                    shorthand = {
                        pattern = "()#%x%x%x()%f[^%x%w]",
                        group = function(_, _, data)
                            ---@type string
                            local match = data.full_match
                            local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
                            local hex_color = "#" .. r .. r .. g .. g .. b .. b

                            return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
                        end,
                        extmark_opts = { priority = 2000 },
                    },
                },
            }
        end,
        config = function(_, opts)
            if type(opts.tailwind) == "table" and opts.tailwind.enabled then
                -- reset hl groups when colorscheme changes
                vim.api.nvim_create_autocmd("ColorScheme", {
                    callback = function()
                        M.hl = {}
                    end,
                })
                opts.highlighters.tailwind = {
                    pattern = function()
                        if not vim.tbl_contains(opts.tailwind.ft, vim.bo.filetype) then
                            return
                        end
                        if opts.tailwind.style == "full" then
                            return "%f[%w:-]()[%w:-]+%-[a-z%-]+%-%d+()%f[^%w:-]"
                        elseif opts.tailwind.style == "compact" then
                            return "%f[%w:-][%w:-]+%-()[a-z%-]+%-%d+()%f[^%w:-]"
                        end
                    end,
                    group = function(_, _, m)
                        ---@type string
                        local match = m.full_match
                        ---@type string, number
                        local color, shade = match:match("[%w-]+%-([a-z%-]+)%-(%d+)")
                        shade = tonumber(shade)
                        local bg = vim.tbl_get(M.colors, color, shade)
                        if bg then
                            local hl = "MiniHipatternsTailwind" .. color .. shade
                            if not M.hl[hl] then
                                M.hl[hl] = true
                                local bg_shade = shade == 500 and 950 or shade < 500 and 900 or 100
                                local fg = vim.tbl_get(M.colors, color, bg_shade)
                                vim.api.nvim_set_hl(0, hl, { bg = "#" .. bg, fg = "#" .. fg })
                            end
                            return hl
                        end
                    end,
                    extmark_opts = { priority = 2000 },
                }
            end
            require("mini.hipatterns").setup(opts)
        end,
    },
}
