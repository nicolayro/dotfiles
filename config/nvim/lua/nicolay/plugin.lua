-- Contains installed plugins. Setup of plugins is located in after/plugin

-- Configure lazy.nvim package manager
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Colorscheme
    "rose-pine/neovim",
    "ellisonleao/gruvbox.nvim",
    "folke/tokyonight.nvim",
    "aktersnurra/no-clown-fiesta.nvim",

    -- Git
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",

    -- Nice statusbar
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                icons_enabled = false,
                component_separators = "|",
                section_separators = "",
            },
        },
    },

    -- Highlight, edit, and navigate code
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        build = ":TSUpdate",
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim", config=true,
            "williamboman/mason-lspconfig.nvim",
        }
    },

    -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",

            -- Snipping engine
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",

        }
    },

    -- Easier config
    "folke/neodev.nvim",

    -- Fuzzy finding
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Easy comments
    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
        lazy = false,
    }


})
