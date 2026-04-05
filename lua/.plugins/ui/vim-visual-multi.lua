-- Vim-visual-multi - Multi-cursor editing
-- Multiple cursors for visual selection

return {
  "mg979/vim-visual-multi",
  branch = "master",
  config = function()
    vim.g.VM_theme = "gruvbox"
    vim.g.VM_show_warnings = 0
    vim.g.VM_default_options = {
      set_cursor = true,
      start_in_insert_mode = true,
      show_warning_message = 0,
      resume_for_command = false,
    }
  end,
}
