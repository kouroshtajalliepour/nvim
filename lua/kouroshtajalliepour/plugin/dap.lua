return {
  'mfussenegger/nvim-dap',
  dependencies = {
    { 'rcarriga/nvim-dap-ui', dependencies = { 'nvim-neotest/nvim-nio' } },
    'theHamsta/nvim-dap-virtual-text',
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    dapui.setup()
    require('nvim-dap-virtual-text').setup({})
    require('kouroshtajalliepour.dap-node').setup(dap)

    -- Open the UI when a session starts, close it when the program ends.
    dap.listeners.before.attach.dapui_config = dapui.open
    dap.listeners.before.launch.dapui_config = dapui.open
    dap.listeners.before.event_terminated.dapui_config = dapui.close
    dap.listeners.before.event_exited.dapui_config = dapui.close

    local function map(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { desc = 'Debug: ' .. desc })
    end

    map('<leader>bb', dap.toggle_breakpoint, 'Toggle [B]reakpoint')
    map('<leader>bB', function()
      dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end, 'Conditional [B]reakpoint')
    map('<leader>bc', dap.continue, 'Start/[C]ontinue')
    map('<leader>bt', dap.terminate, '[T]erminate')
    map('<leader>bo', dap.step_over, 'Step [O]ver')
    map('<leader>bi', dap.step_into, 'Step [I]nto')
    map('<leader>bO', dap.step_out, 'Step [O]ut')
    map('<leader>bu', dapui.toggle, 'Toggle [U]I')

    map('<F5>', dap.continue, 'Start/Continue')
    map('<F10>', dap.step_over, 'Step Over')
    map('<F11>', dap.step_into, 'Step Into')
    map('<F12>', dap.step_out, 'Step Out')
  end,
}
