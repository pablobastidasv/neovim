return {
  {
    'williamboman/mason.nvim',
    config = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = { -- require('mason-lspconfig').setup(opts)
      ensure_installed = {
        "lua_ls",
        'tsserver',
      }
    },
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')

      -- configure the server
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})

      -- :h vim.lsp.buf
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}) -- shows documentation
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end,
  },
}
