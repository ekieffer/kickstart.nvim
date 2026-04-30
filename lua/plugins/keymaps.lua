return {
  {
    'LazyVim/LazyVim',
    keys = {
      -- Your existing mapping
      {
        '<leader>wsq',
        function()
          vim.cmd 'normal! ciW""'
          vim.cmd 'normal! P'
        end,
        desc = 'Word Surround Quotes',
        mode = 'n',
      },

      -- Move line down
      {
        '<leader>j',
        function()
          vim.cmd 'move +1'
          vim.cmd 'normal! =='
        end,
        desc = 'Move line down',
        mode = 'n',
      },

      -- Move line up
      {
        '<leader>k',
        function()
          vim.cmd 'move -2'
          vim.cmd 'normal! =='
        end,
        desc = 'Move line up',
        mode = 'n',
      },
    },
  },
}
