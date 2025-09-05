return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		keymaps = {
			["<leader>e"] = { "actions.parent", mode = "n" },
		}
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} }},
	lazy = false,
}
