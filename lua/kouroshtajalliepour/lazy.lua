local themes = require("kouroshtajalliepour.plugin.themes")
local search = require("kouroshtajalliepour.plugin.search")
local whichKey = require("kouroshtajalliepour.plugin.which-key")
local gitSigns = require("kouroshtajalliepour.plugin.git-signs")
local lsp = require("kouroshtajalliepour.plugin.lsp")
local todoComments = require("kouroshtajalliepour.plugin.todo-comments")
local mini = require("kouroshtajalliepour.plugin.mini")
local diffview = require("kouroshtajalliepour.plugin.diffview")
local vimFugitive = require("kouroshtajalliepour.plugin.vim-fugitive")
local harpoon = require("kouroshtajalliepour.plugin.harpoon")
local oil = require("kouroshtajalliepour.plugin.oil")
local luaLine = require("kouroshtajalliepour.plugin.lualine")
local undotree = require("kouroshtajalliepour.plugin.undotree")
local foldable = require("kouroshtajalliepour.plugin.foldable")
local cmp = require("kouroshtajalliepour.plugin.cmp")
local incRename = require("kouroshtajalliepour.plugin.inc-rename")

return {
	-- Themes and utils
	themes,
	{"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
	'NMAC427/guess-indent.nvim',
	search,
	whichKey,

	-- git intergration
	gitSigns,
	vimFugitive,
	diffview,

	-- code related
  foldable,
	lsp,
	mini,
	undotree,
	todoComments,
  cmp,
  incRename,


	-- file management
	harpoon,
	oil,
	luaLine
}
