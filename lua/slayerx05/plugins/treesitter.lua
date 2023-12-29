return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      auto_install = true,
      -- ignore_install = { "yaml" },
      -- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "css", "typescript", "javascript", "html", "go" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
