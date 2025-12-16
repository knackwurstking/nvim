-- Makefile targets keymaps
-- Dynamically adds keymaps for all makefile commands available at the current project root
-- Keymaps will start with <space>m, grouped under "Make" in which-key

local M = {}

-- Function to get makefile targets from the current directory
local function get_make_targets()
	local targets = {}

	-- Check for Makefile or makefile in current directory
	local makefile_path = vim.fn.getcwd() .. "/Makefile"
	local makefile_path2 = vim.fn.getcwd() .. "/makefile"

	-- Check if Makefile exists
	if vim.fn.filereadable(makefile_path) == 1 then
		local file = io.open(makefile_path, "r")
		if file then
			for line in file:lines() do
				-- Match target patterns like "target_name:", "target_name:", etc.
				local target = line:match("^([%w_%-%.]+):")
				if target and target ~= "include" and target ~= "export" then
					table.insert(targets, target)
				end
			end
			file:close()
		end
	elseif vim.fn.filereadable(makefile_path2) == 1 then
		-- Check for makefile (lowercase)
		local file = io.open(makefile_path2, "r")
		if file then
			for line in file:lines() do
				-- Match target patterns like "target_name:", "target_name:", etc.
				local target = line:match("^([%w_%-%.]+):")
				if target and target ~= "include" and target ~= "export" then
					table.insert(targets, target)
				end
			end
			file:close()
		end
	end

	return targets
end

-- Function to add keymaps for make targets
local function add_make_keymaps()
	local targets = get_make_targets()

	-- Create a function to add make targets to which-key
	if #targets > 0 then
		-- Add to which-key group
		require("which-key").add({
			{ "<space>m", group = "Make" },
		})

		-- Add keymaps for each target
		for _, target in ipairs(targets) do
			-- Use the target name for the keymap
			local key = "<space>m" .. target
			vim.keymap.set("n", key, "<cmd>make " .. target .. "<CR>", { desc = "Make: " .. target })
		end
	end
end

-- Run the function when the module loads
add_make_keymaps()

return M

