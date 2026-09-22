return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	{
		-- tmux & split window navigation. When the vim-herdr-navigation herdr plugin is
		-- installed, its editor/nvim.lua owns <C-h/j/k/l> instead: crosses into herdr panes
		-- at split edges, falls back to tmux/wincmd outside herdr. Without it (herdr not set
		-- up on this machine), vim-tmux-navigator keeps its own mappings.
		"christoomey/vim-tmux-navigator",
		lazy = false,
		init = function()
			local nav = vim.fn.glob("~/.config/herdr/plugins/github/vim-herdr-navigation-*/editor/nvim.lua", false, true)[1]
			if nav then
				vim.g.tmux_navigator_no_mappings = 1
				vim.g.herdr_navigation_file = nav
			end
		end,
		config = function()
			if vim.g.herdr_navigation_file then
				dofile(vim.g.herdr_navigation_file)
			end
		end,
	},
}
