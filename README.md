# nvim

My Neovim config, built on [lazy.nvim](https://github.com/folke/lazy.nvim).
One file per plugin under `lua/kouroshtajalliepour/plugin/`, so adding,
tuning, or ripping out any single piece never touches the rest.

## Plugins, by purpose

**LSP & completion**
- `lsp.lua` - LSP server setup (via `lazydev.nvim` for Lua itself)
- `cmp.lua` - completion (`nvim-cmp` + LSP/buffer/path/luasnip sources)
- `conform.lua` - format-on-save, per-filetype formatters
- `fidget.lua` - LSP progress notifications

**Finding & moving around**
- `search.lua` - Telescope (fuzzy file/grep/LSP search, fzf-native sorter)
- `harpoon.lua` - pin and jump between a handful of files instantly
- `oil.lua` - edit the filesystem like a buffer
- `undotree.lua` - visual undo history

**Git**
- `git-signs.lua` - gutter signs + hunk staging/navigation
- `vim-fugitive.lua` - `:G`/`:Gstatus`/`:Gdiffsplit` etc.
- `diffview.lua` - side-by-side diff/history view

**Editing**
- `autopairs.lua` - auto-close brackets/quotes, Treesitter-aware
- `autotag.lua` - auto-close/rename matching HTML/JSX tags
- `comment.lua` - `gc`/`gcc` comment toggling
- `sorround.lua` - add/change/delete surrounding pairs
- `inc-rename.lua` - live-preview LSP rename
- `vim-visual-multi.lua` - multiple cursors
- `mini.lua` - small independent utilities (text objects, etc.)

**UI**
- `themes.lua` - colorscheme (onedark)
- `lualine.lua` - statusline
- `which-key.lua` - keybind hints as you type
- `foldable.lua` - better code folding (`nvim-ufo`)
- `trouble.lua` - diagnostics/quickfix list UI
- `todo-comments.lua` - highlight TODO/FIXME/etc. comments
- `markdown.lua` - render Markdown in-buffer

**Syntax**
- `treesitter.lua` - parsing/highlighting for every language I touch

## Structure

`init.lua` loads, in order: `remap` (keymaps) -> `todo-logic` -> `set`
(options) -> `automations` (autocmds) -> `loadLazy` (bootstraps lazy.nvim
and pulls in every file under `lua/kouroshtajalliepour/plugin/`
automatically). Each plugin file just returns a lazy.nvim spec - no
central plugin list to keep in sync by hand.

## CI

GitHub Actions checks every `.lua` file parses (`luac -p`) on every push.
Security scanning is handled separately by the Snyk GitHub App.
