return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = { -- require(bufferline).setup(opts)
    options = {
      mode = "buffers",
      separator_style = "slant",
      diagnostics = "nvim_lsp",
    },
  },
}
