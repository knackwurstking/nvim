-- Indent-blankline - Indentation guides
-- Shows indent levels in the gutter

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local highlights = require("ibl.config").extend({
      indent = {
        char = "│",
      },
      scope = {
        char = "│",
      },
    })

    require("ibl").setup({
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        char = "│",
      },
      exclude = {
        filetypes = {
          "dashboard",
          "alpha",
          "starter",
          "lazy",
          "TelescopePrompt",
          "TelescopeResults",
          " Trouble",
          "neo-tree",
        },
      },
    })
  end,
}
