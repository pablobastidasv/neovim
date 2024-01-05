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
				"tsserver",
				"gopls",
				"html",
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
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
				filetypes = { "html", "gohtmltmpl" }, -- lsp html capabilities in go html template files
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			-- :h vim.lsp.buf
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) -- shows documentation
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gu", vim.lsp.buf.references, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "cr", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
