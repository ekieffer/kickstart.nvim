return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      local dapvt = require 'nvim-dap-virtual-text'

      dapui.setup {
        commented = true,
      }

      dapvt.setup()

      dap.adapters['rust-gdb'] = {
        type = 'executable',
        command = 'rust-gdb',
        args = { '--interpreter=dap', '--eval-command', 'set print pretty on' },
      }

      dap.configurations.rust = {
        {
          name = 'Launch',
          type = 'rust-gdb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          args = {}, -- provide arguments if needed
          cwd = '${workspaceFolder}',
          stopAtBeginningOfMainSubprogram = false,
        },
        {
          name = 'Select and attach to process',
          type = 'rust-gdb',
          request = 'attach',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          pid = function()
            local name = vim.fn.input 'Executable name (filter): '
            return require('dap.utils').pick_process { filter = name }
          end,
          cwd = '${workspaceFolder}',
        },
        {
          name = 'Attach to gdbserver :1234',
          type = 'rust-gdb',
          request = 'attach',
          target = 'localhost:1234',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
        },
      }

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

      vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, { desc = '[D]ebugging toggle [b]reakpoint' })
      vim.keymap.set('n', '<Leader>dc', dap.continue, { desc = '[D]ebugging [c]ontinue' })
      vim.keymap.set('n', '<Leader>dC', dap.continue, { desc = '[D]ebugging [C]lose' })
    end,
  },
  {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    config = function()
      require('dap-python').setup 'python3'
    end,
  },
}
