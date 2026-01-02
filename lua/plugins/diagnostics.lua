return {
  {
    'neovim/nvim-lspconfig',
    init = function()
      vim.api.nvim_create_autocmd('CursorHold', {
        callback = function()
          vim.diagnostic.open_float(nil, {
            focus = false,
            scope = 'cursor',
            border = 'rounded',
            source = 'if_many',
          })
        end,
      })
    end,
  },
}
