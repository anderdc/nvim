-- Make Neovim follow the active Omarchy theme's colorscheme.
--
-- Omarchy writes ~/.config/omarchy/current/theme/neovim.lua as a LazyVim-style
-- spec: one (or more) colorscheme plugin(s) plus a meta entry
--   { "LazyVim/LazyVim", opts = { colorscheme = "<name>" } }
-- We install the colorscheme plugin(s), read "<name>", and apply it — while
-- ignoring the LazyVim meta plugin (this config is plain lazy.nvim, not LazyVim).
--
-- The colorscheme is applied on VimEnter so it wins over any scheme set earlier
-- during startup (e.g. kanagawa). If the Omarchy theme file is missing/malformed
-- this returns nothing and your existing kanagawa setup remains as the fallback.
-- The palette updates on the next `nvim` launch after `omarchy theme set ...`.

local theme_file = vim.fn.expand("~/.config/omarchy/current/theme/neovim.lua")

if vim.fn.filereadable(theme_file) == 0 then
	return {}
end

local ok, spec = pcall(dofile, theme_file)
if not ok or type(spec) ~= "table" then
	return {}
end

local colorscheme = nil
local plugins = {}

for _, entry in ipairs(spec) do
	if type(entry) == "table" then
		if entry.opts and entry.opts.colorscheme then
			colorscheme = entry.opts.colorscheme
		end
		local name = entry[1]
		if type(name) == "string" and name ~= "LazyVim/LazyVim" then
			entry.lazy = false
			entry.priority = 1000
			plugins[#plugins + 1] = entry
		end
	end
end

if colorscheme then
	-- Apply after startup so it overrides any other colorscheme (kanagawa, etc.).
	vim.api.nvim_create_autocmd("VimEnter", {
		once = true,
		callback = function()
			pcall(vim.cmd.colorscheme, colorscheme)
		end,
	})
end

return plugins
