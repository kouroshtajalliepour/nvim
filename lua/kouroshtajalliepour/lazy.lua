local themes = require("kouroshtajalliepour.plugin.themes")
local search = require("kouroshtajalliepour.plugin.search")
local whichKey = require("kouroshtajalliepour.plugin.which-key")
local gitSigns = require("kouroshtajalliepour.plugin.git-signs")
local todoComments = require("kouroshtajalliepour.plugin.todo-comments")
local mini = require("kouroshtajalliepour.plugin.mini")
local diffview = require("kouroshtajalliepour.plugin.diffview")
local vimFugitive = require("kouroshtajalliepour.plugin.vim-fugitive")
local harpoon = require("kouroshtajalliepour.plugin.harpoon")
local luaLine = require("kouroshtajalliepour.plugin.lualine")
local undotree = require("kouroshtajalliepour.plugin.undotree")
local multi = require("kouroshtajalliepour.plugin.vim-visual-multi")
local comment = require("kouroshtajalliepour.plugin.comment")
local autopairs = require("kouroshtajalliepour.plugin.autopairs")
local surround = require("kouroshtajalliepour.plugin.sorround")

return {
  -- Themes and utils
  themes,
  'NMAC427/guess-indent.nvim',
  search,
  whichKey,

  -- git integration
  gitSigns,
  vimFugitive,
  diffview,

  -- code related
  comment,
  mini,
  undotree,
  todoComments,
  multi,
  autopairs,
  surround,

  -- file management
  harpoon,
  luaLine
}
