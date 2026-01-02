return {
  'neovim/nvim-lspconfig',
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
