return {
    -- { "tpope/vim-fugitive" },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            vim.keymap.set("n", "gst", ":LazyGit<CR>")
        end,
    },
}
