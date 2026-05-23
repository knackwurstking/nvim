vim.pack.add({ "https://github.com/carlos-algms/agentic.nvim" })

--- Track token usage from ACP usage_update events.
--- Stores entries with timestamp for later review via :UsageLog.
local usage_log = {
	bufnr = nil,
	entries = {},
}

local function format_cost(cost)
	if not cost then return "N/A" end
	return string.format("%.4f %s", cost.amount, cost.currency or "USD")
end

local function format_timestamp_full()
	return os.date("%Y-%m-%d %H:%M:%S")
end

local function open_usage_log()
	local buf = usage_log.bufnr

	if buf and vim.api.nvim_buf_is_valid(buf) then
		-- Reuse existing buffer, find its window or open it
		local win = vim.fn.bufwinnr(buf)
		if win ~= -1 then
			vim.api.nvim_set_current_win(win)
			return
		end
	end

	-- Create new scratch buffer
	buf = vim.api.nvim_create_buf(false, true)
	usage_log.bufnr = buf
	vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
	vim.api.nvim_buf_set_option(buf, "modifiable", false)
	vim.api.nvim_buf_set_name(buf, "agentic://usage-log")

	local width = math.max(60, math.floor(vim.o.columns * 0.4))
	local height = math.max(10, math.floor(vim.o.lines * 0.3))

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2),
		col = math.floor((vim.o.columns - width) / 2),
		style = "minimal",
		border = "rounded",
		title = " Token Usage Log ",
		title_pos = "center",
	})

	vim.api.nvim_set_option_value("winhl", "Normal:NormalFloat,FloatBorder:FloatBorder", { win = win })

	usage_log:_refresh_buffer()
end

function usage_log:_refresh_buffer()
	local buf = self.bufnr
	if not buf or not vim.api.nvim_buf_is_valid(buf) then return end

	local lines = {
		"╭────────────────────────────────────────────────────────────╮",
		"│                   Token Usage Overview                     │",
		"╰────────────────────────────────────────────────────────────╯",
		"",
	}

	if next(self.entries) then
		local latest = self.entries[#self.entries]

		lines[#lines + 1] = "  Current Session:"
		lines[#lines + 1] = string.format("    Tokens used : %d / %d  (%.1f%%)",
			latest.used, latest.size,
			(latest.used / math.max(latest.size, 1)) * 100)
		lines[#lines + 1] = string.format("    Cost        : %s", format_cost(latest.cost))
		lines[#lines + 1] = ""
		lines[#lines + 1] = "  History:"
		lines[#lines + 1] = string.format("    %-19s │ %8s │ %8s │ %s", "Time", "Used", "Size", "Cost")
		lines[#lines + 1] = "    " ..
		string.rep("─", 19) .. "┼" .. string.rep("─", 10) .. "┼" .. string.rep("─", 10) .. "┼" .. string.rep("─", 16)

		for _, entry in ipairs(self.entries) do
			lines[#lines + 1] = string.format("    %-19s │ %8d │ %8d │ %s",
				entry.timestamp, entry.used, entry.size, format_cost(entry.cost))
		end
	else
		lines[#lines + 1] = "  No usage data yet."
		lines[#lines + 1] = "  Usage updates will appear once you start chatting."
	end

	lines[#lines + 1] = ""
	lines[#lines + 1] = "  (close with :q or <Esc>)"

	vim.api.nvim_buf_set_option(buf, "modifiable", true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.api.nvim_buf_set_option(buf, "modifiable", false)

	-- Keymaps for the buffer
	local buf_opts = { buffer = buf, nowait = true, silent = true }
	vim.keymap.set("n", "q", "<cmd>bdelete<CR>", buf_opts)
	vim.keymap.set("n", "<Esc>", "<cmd>bdelete<CR>", buf_opts)
end

function usage_log:add_entry(used, size, cost)
	table.insert(self.entries, {
		timestamp = format_timestamp_full(),
		used = used,
		size = size,
		cost = cost,
	})

	-- Also refresh the buffer if it's open
	self:_refresh_buffer()
end

require("agentic").setup({
	provider = "opencode-acp",
	hooks = {
		on_session_update = function(data)
			if data.update.sessionUpdate == "usage_update" then
				local u = data.update
				usage_log:add_entry(u.used, u.size, u.cost)

				-- Also show a quick notification with current usage
				local pct = (u.used / math.max(u.size, 1)) * 100
				vim.notify(string.format("Tokens: %d / %d (%.1f%%)  Cost: %s",
						u.used, u.size, pct, format_cost(u.cost)),
					vim.log.levels.INFO, { title = "Agentic Usage" })
			end
		end,
	},
	windows = {
		position = "bottom", -- "right", "left", or "bottom"
		width = "45%", -- Sidebar width (position = "right" or "left")
		height = "35%", -- Panel height (position = "bottom")
	},
})

-- Monkey-patch MessageWriter to suppress thought chunks from chat display.
-- This lives in the user config, so it survives plugin reinstalls.
-- The thinking animation still runs — only the visible output is hidden.
do
	local MessageWriter = require("agentic.ui.message_writer")
	local original_write = MessageWriter.write_message_chunk

	MessageWriter.write_message_chunk = function(self, update)
		if update.sessionUpdate == "agent_thought_chunk" then
			return
		end
		return original_write(self, update)
	end
end

-- Command: :UsageLog — opens token usage log window
vim.api.nvim_create_user_command("UsageLog", open_usage_log, {
	desc = "Open agentic.nvim token usage log",
})

-- Custom command: :VisionAnalyze <image_path> [prompt]
vim.api.nvim_create_user_command("VisionAnalyze", function(args)
	local img_path = args.args and args.args:gsub("^%s+", "") or ""
	if img_path == "" then
		vim.notify("Usage: :VisionAnalyze <image_path> [prompt]", vim.log.levels.ERROR)
		return
	end

	if not vim.loop.fs_stat(img_path) then
		vim.notify("File not found: " .. img_path, vim.log.levels.ERROR)
		return
	end

	local skill_script = os.getenv("HOME") .. "/.config/opencode/skills/vision-analyze/analyze.sh"
	local prompt = args.bang and ' "' .. args.args:gsub(img_path, ""):gsub("^%s+", '') .. '"' or ''

	vim.notify("Analyzing image with Qwen Vision...", vim.log.levels.INFO)

	vim.fn.jobstart({
		"bash", "-c",
		string.format('%s %q%s', skill_script, img_path, prompt),
	}, {
		on_stdout = function(_, data)
			if data and #data > 0 then
				local output = table.concat(data, "\n")
				vim.notify("✅ Vision Analysis:\n" .. output:gsub("\n", " "), vim.log.levels.INFO)
				vim.fn.setreg("+", output) -- Copy to clipboard too
			end
		end,
		on_stderr = function(_, data)
			if data and #data > 0 then
				vim.notify("Vision Error: " .. table.concat(data, "\n"), vim.log.levels.ERROR)
			end
		end,
	})
end, {
	nargs = "*",
	desc = "Analyze image with Qwen Vision via LM Studio",
	complete = function(arg_lead, cmdline, _)
		if cmdline:match("^.*%s+$") then
			return vim.fn.globpath(".", arg_lead .. "*")
		end
	end,
})
