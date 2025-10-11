-- Using lazy.nvim

return {
  'nosduco/remote-sshfs.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  config = function()
    require('remote-sshfs').setup {
      connections = {
        sshfs_args = { -- arguments to pass to the sshfs command
          '-o reconnect',
          '-o ConnectTimeout=5',
          '-o follow_symlinks',
          '-o Ciphers=chacha20-poly1305@openssh.com',
          '-o Compression=no',
        },
      },
    }
    local api = require 'remote-sshfs.api'
    vim.keymap.set('n', '<leader>rc', api.connect, { desc = '[R]emote [C]onnect' })
    vim.keymap.set('n', '<leader>rd', api.disconnect, { desc = '[R]emote [D]isconnect' })
    vim.keymap.set('n', '<leader>re', api.edit, { desc = '[R]emote [E]dit' })

    -- (optional) Override telescope find_files and live_grep to make dynamic based on if connected to host
    local builtin = require 'telescope.builtin'
    local connections = require 'remote-sshfs.connections'
    vim.keymap.set('n', '<leader>ff', function()
      if connections.is_connected() then
        api.find_files()
      else
        builtin.find_files()
      end
    end, {})
    vim.keymap.set('n', '<leader>rg', function()
      if connections.is_connected() then
        api.live_grep()
      else
        builtin.live_grep()
      end
    end, { desc = '[R]emote [G]rep' })
  end,
}
