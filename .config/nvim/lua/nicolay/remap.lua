-- Set <leader> to Space
vim.g.mapleader = " "

-- Acccess file menu with '-' (same as move out one directory inside explorer)
-- vim.keymap.set("n", "-", vim.cmd.Explore)

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in position when joining lines with 'J'
vim.keymap.set("n", "J", "mzJ`z")

-- Center cursor on move up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste and delete without overwriting paste buffer
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

vim.keymap.set("i", "<C-c>", "<Esc>")

