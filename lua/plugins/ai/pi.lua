vim.pack.add({
	"https://github.com/pablopunk/pi.nvim",
})


-- For Documentation: (Set only what you need to change)
--
--require("pi").setup({
--  binary = "~/.bin/pi", -- or { "env", "FOO=1", "pi-wrapper" }
--  provider = "openrouter",
--  model = "openrouter/free",
--  thinking = "off", -- be careful, thinking is time-consuming, it's not a great experience if you want simplicity
--  system_prompt = "You are a helpful assistant.",
--  append_system_prompt = "Always respond concisely.",
--  context = {
--    max_bytes = 24000,
--    ask = {
--      surrounding_lines = 80,
--    },
--    selection = {
--      surrounding_lines = 40,
--    },
--    diagnostics = {
--      enabled = false,
--    },
--  },
--  skills = true,
--  extensions = true,
--})
require("pi").setup({
  provider = "omlx",
  model = "Qwen3.6-35B-A3B-Uncensored-Heretic-MLX-6bit",
  thinking = "off",
  system_prompt = "Sei extrem knapp. Keine Erklärungen, nur Code. Keine Begrüßungen, keine Zusammenfassungen. Direkte Antworten.",
})
