return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"tpope/vim-fugitive",
	},
	config = function()
		require("dapui").setup()
		require("dap-go").setup()

		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		-- dap.listeners.before.event_terminated.dapui_config = function()
		--     dapui.close()
		-- end
		-- dap.listeners.before.event_exited.dapui_config = function()
		--     dapui.close()
		-- end

		vim.keymap.set("n", "<Leader>dR", dap.continue, {})
		vim.keymap.set("n", "<Leader>dr", dap.run_last, {})
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dx", dapui.close, {})
		vim.keymap.set("n", "M", dap.continue, {})
		vim.keymap.set("n", "N", dap.step_over, {})
		vim.keymap.set("n", "E", dap.step_into, {})
		vim.keymap.set("n", "'", dap.terminate, {})
	end,
}
