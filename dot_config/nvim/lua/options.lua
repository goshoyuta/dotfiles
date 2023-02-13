vim.g.mapleader = " "
-- basis
vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.showmatch = true -- when a bracket is inserted, briefly jump to the matching one.
vim.opt.swapfile = false
vim.opt.scrolloff = 3 -- lines of context
vim.opt.backup = false -- nobackup and writebackup --> delete bakcup if file saved
vim.opt.writebackup = true
vim.opt.history = 10000 -- command history
vim.opt.hidden = true -- enable background buffers
vim.opt.number = true -- show line numbers
-- vim.opt.relativenumber = true
-- search
vim.opt.ignorecase = true -- ignore case
vim.opt.incsearch = true -- incremental search
vim.opt.smartcase = true -- do not ignore case with capitals
-- look
vim.opt.termguicolors = true -- true color support
vim.opt.title = true
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = {
	-- space = '⋅',
	eol = "⤶",
	tab = "»-",
	trail = "-",
	extends = "»",
	precedes = "«",
	nbsp = "%",
}
-- indent
vim.opt.autoindent = true
vim.opt.smartindent = true -- insert indents automatically
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.tabstop = 2 -- number of spaces tabs count for
vim.opt.softtabstop = 2
vim.opt.shiftround = true -- round indent
vim.opt.shiftwidth = 2 -- size of an indent
vim.opt.indentexpr = ""
