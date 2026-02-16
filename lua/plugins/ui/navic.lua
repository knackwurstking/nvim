-- UI and appearance plugins
-- Navic - VSCode-like breadcrumbs

return {
  "SmiteshP/nvim-navic",
  dependencies = "neovim/nvim-lspconfig",
  config = function()
    require("nvim-navic").setup({
      lsp = {
        auto_attach = true,
        preference = nil,
      },
      click = true,
      depth_limit = 8,
      depth_limit_indicator = "...",
      icons = {
        Array = "󰅪 ",
        Boolean = "󰨙 ",
        Class = "󰠱 ",
        Constant = "󰏿 ",
        Constructor = "󰆧 ",
        Enum = "󰅩 ",
        EnumMember = "󰗡 ",
        Event = "󰉖 ",
        Field = "󰇽 ",
        File = "󰈙 ",
        Folder = "󰉋 ",
        Function = "󰊕 ",
        Interface = "󰅲 ",
        Key = "󰌆 ",
        Keyword = "󰌋 ",
        Method = "󰆧 ",
        Module = "󰏗 ",
        Namespace = "󰅩 ",
        Null = "󰟢 ",
        Number = "󰎠 ",
        Object = "󰈙 ",
        Operator = "󰆕 ",
        Package = "󰏖 ",
        Property = "󰇧 ",
        String = "󰉾 ",
        Struct = "󰙅 ",
        Text = "󰉬 ",
        TypeParameter = "󰅲 ",
        Variable = "󰀧 ",
      },
      highlight = false,
      separator = "  ",
      format = function(item)
        return item.name
      end,
    })
  end,
}
