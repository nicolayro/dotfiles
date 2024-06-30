require("nvim-treesitter.configs").setup({
    ensure_installed = {},
    sync_install = false,
    auto_install = false,
    ignore_install = {},
    modules = {
    },

    indent = {
        enable = true
    },

    highlight = {
        enable = true,
        additional_vim_regex_Hightlighting = {},
    }
})
