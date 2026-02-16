-- Alpha - Dashboard/Startup screen
-- Welcome screen for Neovim

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local function button(sc, txt, keybind, keybind_opts)
      local b = dashboard.button(sc, txt, keybind, keybind_opts)
      b.opts.hl_shortcut = "Macro"
      return b
    end

    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗████████╗███████╗",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║╚══██╔══╝██╔════╝",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║   ██║   ███████╗",
      "  ██║╚██╗██║██╔══╝  ██║   ██║██║   ██║   ██║   ╚════██║",
      "  ██║ ╚████║███████╗╚██████╔╝╚██████╔╝   ██║   ███████║",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝",
      "                                                     ",
    }

    dashboard.section.buttons.val = {
      button(" SPC f f ", "  Find File  ", "<space>ff"),
      button(" SPC f h ", "  Find Help  ", "<space>fh"),
      button(" SPC f w ", "  Find Word  ", "<space>fw"),
      button(" SPC f r ", "  Recent     ", "<space>fr"),
      button(" SPC e n ", "  New File   ", "<space>en"),
    }

    dashboard.section.footer.val = {
      "  Press `q` to close | `SPC ?` for keybindings",
    }

    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "alpha",
      callback = function()
        vim.keymap.set("n", "q", "<cmd>Alpha<cr>", { buffer = true })
      end,
    })
  end,
}
