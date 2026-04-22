return {
  {
    'LazyVim/LazyVim',
    keys = {
      {
        '<leader>wsq',
        function()
          vim.cmd 'normal! ciw""'
          vim.cmd 'normal! P'
        end,
        desc = 'Word Surround Quotes',
        mode = 'n',
      },
    },
  },
}
