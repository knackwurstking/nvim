-- Diagnostics plugins
-- Trouble diagnostic viewer

return {
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
}
