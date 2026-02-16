-- Rainbow-delimiters - Rainbow parentheses
-- Color-code nested brackets and parentheses

return {
  "HiPhish/rainbow-delimiters.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local highlight = {
      "RainbowDelimiterRed",
      "RainbowDelimiterYellow",
      "RainbowDelimiterBlue",
      "RainbowDelimiterOrange",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterCyan",
    }

    require("rainbow-delimiters.setup").setup({
      strategy = {
        [""] = require("rainbow-delimiters.strategy.global"),
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      priority = {
        [""] = 110,
      },
      highlight = highlight,
    })

    vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#fb4934" })
    vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#fabd2f" })
    vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#83a598" })
    vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#fe8019" })
    vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#b8bb26" })
    vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#d3869b" })
    vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#8ec07c" })
  end,
}
