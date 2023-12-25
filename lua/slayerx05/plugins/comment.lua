return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local comment = require('Comment')

    comment.setup({})

    vim.keymap.set("n", 'c/', function()
        return vim.v.count == 0
            and '<Plug>(comment_toggle_linewise_current)<Down>'
            or '<Plug>(comment_toggle_linewise_count)<Down>'
    end, { expr = true })

    vim.keymap.set("x", 'c/', '<Plug>(comment_toggle_linewise_visual)')
  end
}
