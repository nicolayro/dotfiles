require("oil").setup()

-- vim-vinegar style navigation
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
