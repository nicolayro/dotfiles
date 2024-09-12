-- Speed
vim.opt.updatetime = 250

-- Better autocomplete
-- vim.opt.completeopt = "menuone, noselect"

-- Colors and style
vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.scrolloff = 4

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cinoptions = "l1"   -- Solves switch/case indent in C.

-- Extra columns
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- Backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
