return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		input = { enabled = true }, -- prettier vim.ui.input
		select = { enabled = true }, -- prettier vim.ui.select (code actions, etc.)
		notifier = { enabled = true }, -- prettier notifications
		quickfile = { enabled = true }, -- fast file opening
	},
}
