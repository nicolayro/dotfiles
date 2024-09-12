local cmp = require("cmp")

cmp.setup {
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  completion = {
    autocomplete = {
      "TextChanged", "InsertEnter"
    },
    completeopt = 'menu,menuone',
    keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
    keyword_length = 1,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-n>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item()
      else
        cmp.complete()
      end
    end),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-y>"] = cmp.mapping.confirm {
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" },
    },
    -- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
    -- ["<C-Space>"] = cmp.mapping.complete {},
    -- ["<CR>"] = cmp.mapping.confirm {
    --   behavior = cmp.ConfirmBehavior.Replace,
    --   select = true,
    -- },
    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_locally_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.locally_jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "vimtex" }
    -- { name = "buffer" },
  },
}

-- vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")
