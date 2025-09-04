return {
	{
		"tpope/vim-fugitive",
		cmd = { "G", "Git", "Gdiffsplit", "Gstatus", "Gblame", "Gread" },
		keys = {
			{ "<leader>gs", ":Gstatus<CR>", desc = "Git Status" },
			{ "<leader>gc", ":Gcommit<CR>", desc = "Git Commit" },
			{ "<leader>gd", ":Gdiffsplit<CR>", desc = "Git Diff Split" },
			{ "<leader>gb", ":Gblame<CR>", desc = "Git Blame" },
			{ "<leader>gp", ":Git push<CR>", desc = "Git Push" },
			{ "<leader>gl", ":Git pull<CR>", desc = "Git Pull" },
		},
		config = function()
			-- Optional: fugitive integration tweaks
			-- Open diff in vertical split by default
			vim.g.fugitive_diff_vertical = 1

			-- Use Fugitive for :Gread and :Gwrite auto-completion
			vim.cmd([[
			command! -nargs=* GWrite execute 'Gwrite' <q-args>
			command! -nargs=* GRead execute 'Gread' <q-args>
			]])
		end,
	},
}
