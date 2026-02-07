--
-- [ config ]
--

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

-- Clipboard sync
vim.schedule(function()
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
