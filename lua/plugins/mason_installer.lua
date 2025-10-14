return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = { 'mason-org/mason.nvim' },
  opts = {
    ensure_installed = {
      'stylua',
      'clangd',
      'clang-format',
      'lua-language-server',
      'bash-language-server',
      'rust-analyzer',
      'shfmt',
      'pylint',
      'pylsp',
      'shellcheck',
    },
  },
}
