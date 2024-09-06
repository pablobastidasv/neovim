return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        vim.keymap.set("n", "<leader>E", ":Neotree filesystem reveal<CR>", { silent = true })
        vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true })

        local neo_tree = require("neo-tree")
        neo_tree.setup({
            close_if_last_window = true,

            filesystem = {
                filtered_items = {
                    hide_gitignored = false,
                    hide_dotfiles = false,
                    hide_by_name = {
                        ".git",
                    },
                    hide_by_pattern = {
                        "*_templ.go",
                        "*_templ.txt",
                    },
                },
            },

            default_component_configs = {
                indent = {
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added = "+",
                        modified = "",
                        -- Status type
                        untracked = "",
                        ignored = "",
                        unstaged = "󰄱",
                        staged = "",
                        conflict = "",
                    },
                },
                -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
                file_size = {
                    enabled = false,
                    required_width = 64, -- min width of window required to show this column
                },
                type = {
                    enabled = false,
                    required_width = 122, -- min width of window required to show this column
                },
                last_modified = {
                    enabled = false,
                    required_width = 88, -- min width of window required to show this column
                },
                created = {
                    enabled = false,
                    required_width = 110, -- min width of window required to show this column
                },
                symlink_target = {
                    enabled = false,
                },
            },
            window = {
                position = "right",
            },
        })
    end,
}
