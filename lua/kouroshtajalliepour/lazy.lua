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
local luaLine = require("kouroshtajalliepour.plugin.lualine")
local undotree = require("kouroshtajalliepour.plugin.undotree")
local foldable = require("kouroshtajalliepour.plugin.foldable")
local cmp = require("kouroshtajalliepour.plugin.cmp")
local incRename = require("kouroshtajalliepour.plugin.inc-rename")
local multi = require("kouroshtajalliepour.plugin.vim-visual-multi")
local conform = require("kouroshtajalliepour.plugin.conform")
local autotag = require("kouroshtajalliepour.plugin.autotag")
local comment = require("kouroshtajalliepour.plugin.comment")
local trouble = require("kouroshtajalliepour.plugin.trouble")
local fidget = require("kouroshtajalliepour.plugin.fidget")
local autopairs = require("kouroshtajalliepour.plugin.autopairs")
local surround = require("kouroshtajalliepour.plugin.sorround")
local markdown = require("kouroshtajalliepour.plugin.markdown")
local treesitter = require("kouroshtajalliepour.plugin.treesitter")

return {
  -- Themes and utils
  themes,
  treesitter,
  'NMAC427/guess-indent.nvim',
  search,
  whichKey,

  -- git integration
  gitSigns,
  vimFugitive,
  diffview,

  -- code related
  comment,
  foldable,
  lsp,
  trouble,
  fidget,
  mini,
  undotree,
  todoComments,
  cmp,
  incRename,
  multi,
  conform,
  autotag,
  autopairs,
  surround,
  markdown,

  -- file management
  harpoon,
  luaLine
}
