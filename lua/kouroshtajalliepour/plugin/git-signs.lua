return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      word_diff = false, -- no inline char-level highlighting; sign column is the only indicator
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
        map('n', '<leader>gt', gitsigns.toggle_deleted, 'Toggle Previous/Current Version')
      end,
    })

    -- Removed lines render as plain text (no background/color block) when toggled on;
    -- the sign column (+ ~ _) stays the only visual indicator of what changed.
    vim.api.nvim_set_hl(0, 'GitSignsDeleteVirtLn', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'GitSignsDeleteVirtLnInline', { link = 'Normal' })
  end,
}
