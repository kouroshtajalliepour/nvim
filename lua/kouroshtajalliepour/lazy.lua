local themes = require("kouroshtajalliepour.plugin.themes")
local search = require("kouroshtajalliepour.plugin.search")
local whichKey = require("kouroshtajalliepour.plugin.which-key")
local gitSigns = require("kouroshtajalliepour.plugin.git-signs")
return {
	-- Themes (load immediately)
	themes,
	-- Treesitter (sync loading)
	{"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
	-- Tab stop detection
	'NMAC427/guess-indent.nvim',

	search,

	whichKey,

	gitSigns
}
