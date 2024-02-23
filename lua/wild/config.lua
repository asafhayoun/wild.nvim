local M = {}

---@alias Transparency "none" | "code" | "all"

---@class WildThemeOptions
---@field transparent {normal: Transparency, blurred: Transparency}
---@field icon_overrides table<string, {color?: string}>

---@type WildThemeOptions
local defaults = {
	transparent = { normal = "none", blurred = "none" },
	icon_overrides = {
		DevIconLicense = { color = "#80a040" },
	},
}

---@param t Transparency
function M._is_code(t)
	return t == "code" or t == "all"
end
---@param t Transparency
function M._is_tree(t)
	return t == "all"
end

---@param options WildThemeOptions | nil
function M.setup(options)
	---@type WildThemeOptions
	M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end
M.setup()
return M
