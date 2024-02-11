local prefix = "<leader>x"

return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
        { prefix,        desc = "Trouble" },
        { prefix .. "X", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostic" },
        { prefix .. "x", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostic" },
        { prefix .. "q", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List" },
    },
    opts = {},
}
