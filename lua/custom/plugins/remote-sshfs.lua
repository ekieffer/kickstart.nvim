-- Using lazy.nvim

return {
  'nosduco/remote-sshfs.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  opts = {},
  keys = {
    { '<leader>rm', ':RemoteSSHFSConnect<CR>', desc = '[O]pen SSH session' },
  },
}
