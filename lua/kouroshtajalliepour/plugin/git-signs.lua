return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    word_diff = true, -- character-level add/remove highlighting on deleted virtual lines
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      map('n', ']c', gitsigns.next_hunk, 'Next Hunk')
      map('n', '[c', gitsigns.prev_hunk, 'Previous Hunk')

      map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', 'Stage Hunk')
      map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', 'Reset Hunk')
      map('n', '<leader>hS', gitsigns.stage_buffer, 'Stage Buffer')
      map('n', '<leader>hR', gitsigns.reset_buffer, 'Reset Buffer')
      map('n', '<leader>hp', gitsigns.preview_hunk, 'Preview Hunk')
      map('n', '<leader>hb', gitsigns.blame_line, 'Blame Line')
      map('n', '<leader>hd', gitsigns.toggle_deleted, 'Toggle Removed Lines (inline diff)')
    end,
  },
}
