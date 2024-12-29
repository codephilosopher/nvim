return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"leoluz/nvim-dap-go",
		"Weissle/persistent-breakpoints.nvim",
	},
	config = function()
		local dap = require("dap")

		-- Setup the go debug adapter
		require("dap-go").setup()

		-- Setup DAP virtual text
		require("nvim-dap-virtual-text").setup({})
		vim.g.dap_virtual_text = true

		-- Allows breakpoints to last between sessions
		require("persistent-breakpoints").setup({
			load_breakpoints_event = { "BufReadPost" },
		})

		-- Setup DAP UI
		local dapui = require("dapui")
		dapui.setup()

		-- Automatically open the DAP UI when the debugging session begins
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Adding symbols for breakpoints and such
		vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "→", texthl = "", linehl = "", numhl = "" })

		-- Keymaps for debugging
		vim.keymap.set("n", "<leader>dB", function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Breakpoint Condition" })
		vim.keymap.set("n", "<leader>db", function()
			require("dap").toggle_breakpoint()
		end, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dc", function()
			require("dap").continue()
		end, { desc = "Continue" })
		vim.keymap.set("n", "<leader>da", function()
			require("dap").continue({ before = get_args })
		end, { desc = "Run with Args" })
		vim.keymap.set("n", "<leader>dC", function()
			require("dap").run_to_cursor()
		end, { desc = "Run to Cursor" })
		vim.keymap.set("n", "<leader>dg", function()
			require("dap").goto_()
		end, { desc = "Go to Line (No Execute)" })
		vim.keymap.set("n", "<leader>di", function()
			require("dap").step_into()
		end, { desc = "Step Into" })
		vim.keymap.set("n", "<leader>dj", function()
			require("dap").down()
		end, { desc = "Down" })
		vim.keymap.set("n", "<leader>dk", function()
			require("dap").up()
		end, { desc = "Up" })
		vim.keymap.set("n", "<leader>dl", function()
			require("dap").run_last()
		end, { desc = "Run Last" })
		vim.keymap.set("n", "<leader>do", function()
			require("dap").step_out()
		end, { desc = "Step Out" })
		vim.keymap.set("n", "<leader>dO", function()
			require("dap").step_over()
		end, { desc = "Step Over" })
		vim.keymap.set("n", "<leader>dp", function()
			require("dap").pause()
		end, { desc = "Pause" })
		vim.keymap.set("n", "<leader>dr", function()
			require("dap").repl.toggle()
		end, { desc = "Toggle REPL" })
		vim.keymap.set("n", "<leader>ds", function()
			require("dap").session()
		end, { desc = "Session" })
		vim.keymap.set("n", "<leader>dt", function()
			require("dap").terminate()
		end, { desc = "Terminate" })
		vim.keymap.set("n", "<leader>dw", function()
			require("dap.ui.widgets").hover()
		end, { desc = "Widgets" })
		vim.keymap.set("n", "<leader>dt", dapui.toggle)
	end,
}
