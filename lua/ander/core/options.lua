vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 --2 spaces for indent width
opt.expandtab = true --expand tab to spaces
opt.autoindent = true -- copy indent from current line whne starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true  -- ignore case when searching
opt.smartcase = true -- if you include mixed case in search, assume case-sensitive

opt.cursorline = true

-- turn on termguicolors for colorscheme to work
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

