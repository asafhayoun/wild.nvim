local M = {}

local defaults = {
	transparent = { tree = { 0, 1 }, code = { 0, 0 } },
}

---@class WildThemeOptions
---@field transparent {tree: number[], code: number[]}

---@type WildThemeOptions
M.options = defaults
function M.setup(options)
	M.options = vim.tbl_deep_extend("force", {}, defaults, options)
end
return M
