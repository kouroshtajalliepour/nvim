-- nvm's npm/node PATH setup lives in ~/.bashrc, which only runs for interactive bash
-- shells. The login shell here is fish (which never sources .bashrc), and Neovim's own
-- job-spawning doesn't go through an interactive shell either, so plugins that shell out
-- to npm/node (e.g. typescript-tools.nvim) can't find them even though `npm` works fine
-- in a regular terminal. Resolve nvm's active npm/node bin dir once, lazily, the first
-- time a JS/TS file is opened, and prepend it to Neovim's own PATH.
local resolved = false

local function ensure_node_on_path()
  if resolved then
    return
  end
  resolved = true

  -- `-i` makes bash source ~/.bashrc (where nvm lives), but it also prints interactive-
  -- shell warnings ("cannot set terminal process group...") that land in the same
  -- captured output, so only the last line is the actual `command -v npm` result.
  local output = vim.fn.system({ 'bash', '-ic', 'command -v npm' })
  local lines = vim.split(vim.trim(output), '\n')
  local npm_path = lines[#lines]
  if vim.v.shell_error ~= 0 or npm_path == '' then
    return
  end

  local bin_dir = vim.fn.fnamemodify(npm_path, ':h')
  if not vim.tbl_contains(vim.split(vim.env.PATH, ':'), bin_dir) then
    vim.env.PATH = bin_dir .. ':' .. vim.env.PATH
  end
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  once = true,
  callback = ensure_node_on_path,
})
