local M = {
	setup = require("wild.config").setup,
}

vim.api.nvim_create_user_command("WildThemeSettings", function()
	local options = require("wild.config").options
	if options == nil then
		return
	end
	local buffer = vim.api.nvim_create_buf(false, true)
	local ns = vim.api.nvim_create_namespace("wild_config")
	local settings = {
		"Wild theme configuration",
		"Transparency (Normal): ",
		"Transparency (Blurred): ",
	}
	vim.api.nvim_buf_set_text(buffer, 0, 0, 0, 0, {
		settings[1],
		settings[2] .. options.transparent.normal,
		settings[3] .. options.transparent.blurred,
	})
	local win = vim.api.nvim_open_win(buffer, true, {
		relative = "win",
		width = vim.api.nvim_win_get_width(0) - 4,
		height = vim.api.nvim_win_get_height(0) - 2,
		row = 1,
		col = 2,
	})
	vim.api.nvim_buf_add_highlight(buffer, ns, "Title", 0, 0, #settings[1])
	vim.api.nvim_buf_add_highlight(buffer, ns, "@attribute", 1, 0, #settings[2])
	vim.api.nvim_buf_add_highlight(buffer, ns, "@attribute", 2, 0, #settings[3])
	vim.api.nvim_buf_add_highlight(buffer, ns, "@string", 1, #settings[2], -1)
	vim.api.nvim_buf_add_highlight(buffer, ns, "@string", 2, #settings[3], -1)
	vim.api.nvim_win_set_hl_ns(win, ns)
end, {})

function M._load()
	-- You probably always want to set this in your vim file
	vim.opt.background = "dark"
	vim.g.colors_name = "wild"
	-- By setting our module to nil, we clear lua's cache,
	-- which means the require ahead will *always* occur.
	--
	-- This isn't strictly required but it can be a useful trick if you are
	-- incrementally editing your config a lot and want to be sure your themes
	-- changes are being picked up without restarting neovim.
	--
	-- Note if you're working in on your theme and have :Lushify'd the buffer,
	-- your changes will be applied with our without the following line.
	--
	-- The performance impact of this call can be measured in the hundreds of
	-- *nanoseconds* and such could be considered "production safe".
	package.loaded["wild.wild"] = nil

	-- include our theme file and pass it to lush to apply
	require("lush")(require("wild.wild"))
end

return M
