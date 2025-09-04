vim.g.mapleader = " "
vim.g.maplocalleader = ' '
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", function()
	-- If current buffer is oil, go to parent dir
	if vim.bo.filetype == "oil" then
		require("oil").actions.parent.callback()
	else
		-- Otherwise open oil in current file's directory
		require("oil").open()
	end
end, { desc = "Open Oil or go up directory" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {silent = true})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {silent = true})
vim.keymap.set("n", "J", ":m .+1<CR>", { silent = true })
vim.keymap.set("n", "K", ":m .-2<CR>", { silent = true })
vim.keymap.set("v", "<C-j>", ":t'>+1<CR>gv=gv")
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set({ "i", "v", "c" }, "<C-c>", "<Esc>")
-- remap s to f
vim.keymap.set("n", "s", "<Nop>")
vim.keymap.set("n", "f", "s")

-- Duplicate line/selection up/down

-- Duplicate Down
vim.keymap.set('n', '<C-j>', 'mt:t+<CR>`t', { noremap = true, silent = true, desc = "Duplicate line down" })
vim.keymap.set('v', '<C-j>', ":t'>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Duplicate selection down" })

-- Duplicate Up
vim.keymap.set('n', '<C-k>', 'mt:t-1<CR>`t', { noremap = true, silent = true, desc = "Duplicate line up" })
vim.keymap.set('v', '<C-k>', ":t'<-1<CR>gv=gv", { noremap = true, silent = true, desc = "Duplicate selection up" })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Disabled arrow keys
vim.keymap.set({'i', 'n', 'v'},'<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set({'i', 'n', 'v'}, '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set({'i', 'n', 'v'}, '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set({'i', 'n', 'v'}, '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- window controll
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

