return {
    "folke/todo-comments.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
    },
    opts = {},
    keys = {
        { "<leader>xt", "<cmd>TodoTrouble",   desc = "See all TODOs lower panel (trouble)" },
        { "<leader>ft", "<cmd>TodoTelescope", desc = "See all TODOs in Telescope" },
    },
}
