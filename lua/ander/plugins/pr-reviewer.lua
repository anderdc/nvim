return {
	"otavioschwanck/github-pr-reviewer.nvim",
	opts = {
		-- options here
	},
	keys = {
		{ "<leader>pr", "<cmd>PRReviewMenu<cr>", desc = "PR Review Menu" },
		{ "<leader>p", ":<C-u>'<,'>PRSuggestChange<CR>", desc = "Suggest change", mode = "v" },
	},
}
