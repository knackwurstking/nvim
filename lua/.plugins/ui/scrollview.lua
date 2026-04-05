-- Scrollview - Scroll indicator
-- Visual scrollbar for navigating buffers

return {
  "dstein64/nvim-scrollview",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("scrollview").setup({
      current_only = false,
      winblend = 0,
      excluded_filetypes = { "alpha", "NvimTree", " Outline" },
      base = "right",
      column = 1,
      signs_enabled = true,
      signs = "gutter",
      sign_priority = 999,
    })
  end,
}
