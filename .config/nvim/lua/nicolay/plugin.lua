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
  "navarasu/onedark.nvim",

  -- Git
  "tpope/vim-fugitive",
  "lewis6991/gitsigns.nvim",

  -- Surround
  "tpope/vim-surround",

  -- Compile and run inside vim
  "tpope/vim-dispatch",

  -- Some jumping nice keymaps
  "tpope/vim-unimpaired",

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
      -- "L3MON4D3/LuaSnip",
      {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
      },
      "saadparwaiz1/cmp_luasnip",
    },
  },

  -- Easier config
  "folke/neodev.nvim",

  -- Fuzzy finding
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- File explorer
  {
    'stevearc/oil.nvim',
    opts = {},
  },

  -- Better comments
  {
    'numToStr/Comment.nvim',
  },


  -- Latex support
  {
    "lervag/vimtex",
    lazy = false,
    init = function ()
      vim.keymap.set('n', '<leader>ll', '<plug>(vimtex-compile)', {})
      vim.keymap.set('n', '<leader>lv', '<plug>(vimtex-view)', {})
      vim.g.vimtex_view_method = 'sioyek'
    end,
    dependencies = { "micangl/cmp-vimtex" }
  }
})
