local gs = require("gitsigns")

-- Toggle line blame
vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame)

gs.setup({
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 10,
  },
})

