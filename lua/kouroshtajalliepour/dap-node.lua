-- TS/JS debugging through vscode-js-debug (Mason's js-debug-adapter), using
-- nvim-dap's built-in support for its pwa-node server mode.
local M = {}

function M.setup(dap)
  dap.adapters['pwa-node'] = {
    type = 'server',
    host = 'localhost',
    port = '${port}',
    executable = {
      -- Mason's launcher for dapDebugServer.js; it needs `node` on PATH,
      -- which node-path.lua guarantees once a JS/TS buffer has opened.
      command = vim.fn.stdpath('data') .. '/mason/bin/js-debug-adapter',
      args = { '${port}' },
    },
  }

  local configurations = {
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch current file',
      program = '${file}',
      cwd = '${workspaceFolder}',
      sourceMaps = true,
    },
    {
      type = 'pwa-node',
      request = 'attach',
      name = 'Attach to process',
      processId = require('dap.utils').pick_process,
      cwd = '${workspaceFolder}',
    },
  }
  dap.configurations.javascript = configurations
  dap.configurations.typescript = configurations
end

return M
