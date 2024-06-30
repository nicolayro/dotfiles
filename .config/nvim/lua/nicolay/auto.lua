-- Helper
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remove trailing whitespace on save
local NicolayGroup = augroup('Nicolay', {})
autocmd({"BufWritePre"}, {
    group = NicolayGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Highlight on yank
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = highlight_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
})
