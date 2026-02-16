-- UI and appearance plugins
-- Colorscheme and status line

return {
  "morhetz/gruvbox",
  config = function()
    vim.cmd("colorscheme gruvbox")

    vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "None" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "None" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermbg = "None" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3c3836", ctermbg = 237 })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#fabd2f", bold = true })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#504945", ctermbg = 239 })
    vim.api.nvim_set_hl(0, "VisualNOS", { bg = "#504945", ctermbg = 239 })

    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#928374", bg = "none" })
    vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#fabd2f", bg = "none" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "#282828", ctermbg = 235 })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#504945", ctermbg = 239 })
    vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#3c3836", ctermbg = 237 })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#928374", ctermbg = 245 })

    vim.api.nvim_set_hl(0, "VertSplit", { fg = "#282828", bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLine", { fg = "#ebdbb2", bg = "#282828" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#928374", bg = "#282828" })

    vim.api.nvim_set_hl(0, "LineNr", { fg = "#665c54", ctermfg = 243 })
    vim.api.nvim_set_hl(0, "LineNrFold", { fg = "#bdae93", ctermfg = 223 })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#504945" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#504945" })
    vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#3c3836", ctermbg = 237 })

    vim.api.nvim_set_hl(0, "MatchParen", { fg = "#fabd2f", bold = true, underline = false })
    vim.api.nvim_set_hl(0, "Error", { fg = "#fb4934", bold = true })
    vim.api.nvim_set_hl(0, "ErrorMsg", { fg = "#fb4934", bg = "#282828" })
    vim.api.nvim_set_hl(0, "WarningMsg", { fg = "#fabd2f" })

    vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#b8bb26", bg = "#282828" })
    vim.api.nvim_set_hl(0, "DiffChange", { fg = "#fabd2f", bg = "#282828" })
    vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#fb4934", bg = "#282828" })
    vim.api.nvim_set_hl(0, "DiffText", { fg = "#83a598", bg = "#282828" })
  end,
}
