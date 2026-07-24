return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	-- main branch does not support lazy-loading
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")

		-- optional: parsers/queries install location (default shown)
		treesitter.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		-- parsers to keep installed (async; :TSUpdate keeps them current)
		treesitter.install({
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"prisma",
			"markdown",
			"markdown_inline",
			"svelte",
			"graphql",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"query",
			"vimdoc",
			"c",
		})

		-- use bash parser for zsh files
		vim.treesitter.language.register("bash", "zsh")

		-- enable highlighting + indentation for any buffer with an installed parser
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(args.match)
				if not (lang and vim.treesitter.language.add(lang)) then
					return
				end
				-- highlighting (provided by Neovim core)
				vim.treesitter.start(args.buf, lang)
				-- treesitter-based indentation (experimental on main)
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
