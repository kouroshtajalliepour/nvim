--
-- [ config ]
--

-- production: a server's terminal may not have a Nerd Font, so no icon glyphs
vim.g.have_nerd_font = false

-- line
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false

vim.opt.expandtab = true   -- use spaces instead of real tab chars
vim.opt.shiftwidth = 2     -- indentation width
vim.opt.tabstop = 2        -- tab character width (visual)
vim.opt.softtabstop = 2    -- editing uses 2 spaces per tab

-- Enable mouse mode, can be useful for resized splits for example!
vim.o.mouse = 'a'

-- Clipboard sync. Over SSH there's no X clipboard on the server, so use OSC 52:
-- the terminal (alacritty, tmux with set-clipboard on) puts yanks on the local clipboard.
vim.schedule(function()
  if vim.env.SSH_TTY then
    local osc52 = require('vim.ui.clipboard.osc52') -- Neovim 0.10+
    vim.g.clipboard = {
      name = 'OSC 52',
      copy = { ['+'] = osc52.copy('+'), ['*'] = osc52.copy('*') },
      -- alacritty doesn't answer OSC 52 reads, so paste from nvim's own register
      -- (paste from the local clipboard with the terminal's paste key instead)
      paste = {
        ['+'] = function() return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') } end,
        ['*'] = function() return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') } end,
      },
    }
  end
  vim.o.clipboard = 'unnamedplus'
end)

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep sign column on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Enable break indent
vim.o.inccommand = 'split'

-- list char configs
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Persist undo history across sessions (pairs with the undotree plugin)
vim.o.undofile = true
