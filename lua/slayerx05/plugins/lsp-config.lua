return {
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = { -- require('mason-lspconfig').setup(opts)
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "gopls",
                "html",
                "clojure_lsp",
                "cssls",
                "templ",
                "htmx",
                "emmet_ls",
                "tailwindcss",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            -- configure the server
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
                filetypes = { "html", "gohtmltmpl", "templ" }, -- lsp html capabilities in go html template files
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
                settings = {
                    gopls = {
                        buildFlags = { "-tags=integration" },
                    },
                },
            })
            lspconfig.clojure_lsp.setup({
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
            lspconfig.templ.setup({
                capabilities = capabilities,
            })
            lspconfig.htmx.setup({
                capabilities = capabilities,
                filetypes = { "html", "templ" },
            })
            lspconfig.emmet_ls.setup({
                capabilities = capabilities,
                filetypes = { "html", "templ" }, -- lsp html capabilities in go html template files
            })
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
                filetypes = { "html", "templ", "javascript", "typescript", "react", "astro" },
                settings = {
                    tailwindCSS = {
                        includeLanguages = {
                            templ = "html",
                        },
                    },
                },
            })

            local telescope = require("telescope.builtin") -- :h vim.lsp.buf

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) -- shows documentation
            vim.keymap.set("n", "gd", telescope.lsp_definitions, {})
            vim.keymap.set("n", "gu", telescope.lsp_references, {})
            vim.keymap.set("n", "gi", telescope.lsp_implementations, {})
            vim.keymap.set("n", "cr", vim.lsp.buf.rename, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
