return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    require("dap-go").setup()
    require("dapui").setup()
    require("dap-python").setup("python")

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = "DAP Continue" })
    vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = "DAP Step Over" })
    vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = "DAP Step Into" })
    vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = "DAP Step Out" })

    vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
    vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end, { desc = "Set Breakpoint" })
    vim.keymap.set('n', '<Leader>lp', function()
      dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end, { desc = "Set Log Point" })

    vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end, { desc = "Open DAP REPL" })
    vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end, { desc = "Run Last DAP Session" })

    vim.keymap.set('n', '<Leader>dq', function()
      dap.terminate()
      require("dapui").close()
    end, { desc = "DAP Terminate + Close UI" }) -- 🚀 new: quick quit

    vim.keymap.set('n', '<Leader>du', function()
      require("dapui").toggle()
    end, { desc = "Toggle DAP UI" }) -- 🚀 new: toggle dap-ui manually

    vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end, { desc = "DAP Hover" })

    vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
      require('dap.ui.widgets').preview()
    end, { desc = "DAP Preview" })

    vim.keymap.set('n', '<Leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end, { desc = "DAP Frames" })

    vim.keymap.set('n', '<Leader>ds', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end, { desc = "DAP Scopes" })
  end
}
