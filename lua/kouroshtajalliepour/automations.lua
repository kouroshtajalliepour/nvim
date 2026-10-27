--
-- [ Automations ]
--

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
-- Store the directory where nvim was launched
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.g.project_root = vim.fn.getcwd()
  end,
})

-- Interactive GlobalSearch function
function _G.GlobalSearchInteractive()
  local root = vim.g.project_root or vim.fn.getcwd()

  -- Prompt for search string
  local search = vim.fn.input("Search for: ")
  if search == "" then return end

  -- Prompt for replace string
  local replace = vim.fn.input("Replace with: ")
  if replace == "" then replace = search end

  -- Ask for case sensitivity
  local case = vim.fn.input("Case sensitive? (y/n): ")
  local caseSensitive = (case:lower() == "y") and 1 or 0

  -- Ask for exact word match
  local exact = vim.fn.input("Exact word? (y/n): ")
  exact = (exact:lower() == "y") and 1 or 0

  -- Ask for hard replace
  local hard = vim.fn.input("Replace immediately? (y/n): ")
  hard = (hard:lower() == "y") and 1 or 0

  -- Build pattern
  local pattern = search
  if exact == 1 then
    pattern = "\\<" .. search .. "\\>"
  end

  local flags = "ge"
  if caseSensitive == 0 then
    pattern = "\\c" .. pattern
  elseif caseSensitive == 1 then
    pattern = "\\C" .. pattern
  end

  -- Load all files under project root
  vim.cmd("args " .. root .. "/**/*")

  if hard == 1 then
    -- Direct replace
    vim.cmd("argdo %s/" .. pattern .. "/" .. replace .. "/" .. flags .. " | update")
    print("Replaced '"..search.."' with '"..replace.."' in project.")
  else
    -- Preview using quickfix
    vim.cmd("vimgrep /" .. pattern .. "/gj " .. root .. "/**/*")
    vim.cmd("copen")
    -- store for ConfirmReplace
    vim.g._last_replace = {pattern=pattern, replacement=replace, flags=flags}
    print("Preview ready in quickfix. Use :ConfirmReplace to apply.")
  end
end

-- ConfirmReplace function
function _G.ConfirmReplace()
  local info = vim.g._last_replace
  if not info then
    print("No preview available.")
    return
  end
  local confirm = vim.fn.input("Replace all occurrences? (y/n): ")
  if confirm:lower() == "y" then
    vim.cmd("cfdo %s/" .. info.pattern .. "/" .. info.replacement .. "/" .. info.flags .. " | update")
    print("Replacement applied.")
  else
    print("Replacement canceled.")
  end
end

-- Commands
vim.api.nvim_create_user_command("GlobalSearch", GlobalSearchInteractive, {})
vim.api.nvim_create_user_command("ConfirmReplace", ConfirmReplace, {})
