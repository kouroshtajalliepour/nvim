local themes = {
	-- Using Lazy
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require('onedark').setup {
				style = 'darker'
			}
			-- Enable theme
			require('onedark').load()
		end
	},
--	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
--	{ "folke/tokyonight.nvim" },
	--{ "morhetz/gruvbox" },
	--{ "rose-pine/neovim", as = "rose-pine" },
}

return themes


