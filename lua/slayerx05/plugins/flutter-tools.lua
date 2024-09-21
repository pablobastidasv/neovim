return {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    depenencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim",
    },
    config = function()
        require("flutter-tools").setup()
        require("telescope").load_extension("flutter")
    end,
}
