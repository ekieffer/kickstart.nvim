return {
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
  opts = {
    diagnostics = {
      virtual_text = false,
      signs = true,
    },
    servers = {
      clangd = {
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
          fallbackFlags = { '--std=c++23' },
        },
      },
    },
  },
}
