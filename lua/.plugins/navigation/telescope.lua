-- File navigation plugins
-- Telescope fuzzy finder

return {
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
}
