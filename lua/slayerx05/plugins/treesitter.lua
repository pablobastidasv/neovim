return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

        configs.setup({
            auto_install = true,
            -- ignore_install = { "yaml" },
            -- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "css", "typescript", "javascript", "html", "go" },
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        })

        parser_config.gohtmltmpl = {
            install_info = {
                url = "https://github.com/msvechla/tree-sitter-go-template",
                files = { "src/parser.c" },
            },
            filetype = "gohtmltmpl",
            used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" },
        }
    end,
}
