-- UI and appearance plugins
-- Status line configuration

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function get_lsp_client(msg)
      msg = msg or "LSP Inactive"
      local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
      if next(buf_clients) == nil then
        return msg
      end
      local buf_client_names = {}
      for _, client in ipairs(buf_clients) do
        table.insert(buf_client_names, client.name)
      end
      return " LSP: " .. table.concat(buf_client_names, ", ")
    end

    require("lualine").setup({
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        theme = "gruvbox",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = {
          "branch",
          "diff",
        },
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = { modified = "  ", readonly = "  ", unnamed = "[No Name]" },
          },
          {
            function()
              return require("nvim-navic").get_location()
            end,
            cond = function()
              return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
            end,
          },
        },
        lualine_x = {
          {
            get_lsp_client,
            icon = "  ",
            color = { fg = "#fabd2f", gui = "bold" },
          },
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
        },
        lualine_y = {
          {
            function()
              local msg = "No AI"
              local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
              local clients = vim.lsp.get_clients()
              if next(clients) == nil then
                return msg
              end
              for _, client in ipairs(clients) do
                local agent = client.config
                if agent and agent.name == "avante" then
                  msg = " Avante "
                elseif agent and agent.name == "copilot" then
                  msg = " Copilot "
                end
              end
              return msg
            end,
            icon = "",
            color = { fg = "#b8bb26", gui = "bold" },
          },
          "filetype",
        },
        lualine_z = {
          "progress",
          "location",
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "neo-tree", "lazy", "mason", "trouble" },
    })
  end,
}
