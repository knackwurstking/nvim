-- Makefile targets keymaps
-- Dynamically adds keymaps for all makefile commands available at the current project root
-- Keymaps will start with <space>m, grouped under "Make" in which-key
-- Uses first letters of target names to create unique keymaps

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

-- Function to generate unique keymaps from target names
local function get_unique_keymaps(targets)
	local keymaps = {}
	local used_keys = {}

	for _, target in ipairs(targets) do
		local key = ""
		local target_lower = target:lower()

		-- Build key from first letters of words
		for word in target_lower:gmatch("[%w]+") do
			key = key .. word:sub(1, 1)
		end

		-- If key is already taken, we need to make it unique
		-- Try to add numbers or extend the key with more letters if needed
		local original_key = key
		local counter = 1
		while used_keys[key] do
			-- If we've already used this key, try to make it unique
			key = original_key .. counter
			counter = counter + 1
		end

		used_keys[key] = true
		keymaps[target] = key
	end

	return keymaps
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

		-- Get unique keymaps for targets
		local keymaps = get_unique_keymaps(targets)

		-- Add keymaps for each target
		for target, key in pairs(keymaps) do
			-- Use the computed keymap
			local full_key = "<space>m" .. key
			vim.keymap.set("n", full_key, "<cmd>make " .. target .. "<CR>", { desc = "Make: " .. target })
		end
	end
end

-- Run the function when the module loads
add_make_keymaps()

return M

