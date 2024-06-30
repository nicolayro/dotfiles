-- All configured colorschemes

require("rose-pine").setup({
    disable_background = true
})

require("no-clown-fiesta").setup({
    transparent = true
})

require("tokyonight").setup({
    transparent = true
})

require("gruvbox").setup({
    bold = false,
    transparent_mode = true
})

require("onedark").setup({
    transparent = true
})

-- Set actual colorsceme here
vim.cmd.colorscheme("rose-pine")
