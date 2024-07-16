return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",

		-- adapters
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-jest",
	},
	config = function()
		-- get neotest namespace (api call creates or returns namespace)
		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)

		require("neotest").setup({
			-- your neotest config here
			adapters = {
				require("neotest-go"),
				require("neotest-jest")({
					jestCommand = "npm test --",
					jestConfigFile = "custom.jest.config.ts",
					env = { CI = true },
					cwd = function(_)
						return vim.fn.getcwd()
					end,
				}),
			},
		})

		local neotest = require("neotest")
		vim.keymap.set("n", "<Leader>dR", function()
			neotest.run.run(vim.fn.expand("%"))
			neotest.summary.open()
		end, {})
		vim.keymap.set("n", "<Leader>dr", function()
			neotest.run.run_last()
			neotest.summary.open()
		end, {})
		vim.keymap.set("n", "<Leader>dD", function()
			neotest.run.run({ vim.fn.expand("%"), strategy = "dap" })
			neotest.summary.open()
		end, {})
		vim.keymap.set("n", "<Leader>dd", function()
			neotest.run.run_last({ strategy = "dap" })
			neotest.summary.open()
		end, {})
		vim.keymap.set("n", "<Leader>ds", function()
			neotest.summary.toggle()
		end, {})
	end,
}
