return {
    "yetone/avante.nvim",
    event = 'VeryLazy',
    lazy = false,
    version = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        -- optional dependencies
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
            provider = "openai",
            providers = {
                openai = {
                    endpoint = "http://192.168.178.52:11434/v1",
                    model = "gpt-oss:20b",
                    api_key = "",
                    think = "low",
                },
            },
        })
    end,
}
