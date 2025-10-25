return {
  'neovim/nvim-lspconfig',
  opts = {
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
