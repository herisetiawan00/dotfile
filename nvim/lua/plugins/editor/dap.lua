return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require "dap"
			local ui = require "dapui"

			require("dapui").setup {
				mappings = {
					edit = "e",
					expand = "l",
					open = "o",
					remove = "d",
					repl = "r",
					toggle = "t"
				},
				icons = {
					collapsed = "",
					current_frame = "",
					expanded = ""
				},
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.25 },
							"breakpoints",
							"stacks",
							"watches",
						},
						size = 10, -- columns
						position = "bottom",
					},
				},
				controls = {
					element = "repl",
					enabled = true,
					icons = {
						disconnect = "",
						pause = "",
						play = "",
						run_last = "",
						step_back = "",
						step_into = "",
						step_out = "",
						step_over = "",
						terminate = ""
					}
				},
				element_mappings = {},
				expand_lines = true,
				force_buffers = true,

				floating = {
					border = "single",
					mappings = {
						close = { "q", "<Esc>" }
					}
				},
				render = {
					indent = 1,
					max_value_lines = 100
				}
			}

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end

			dap.adapters.dart = {
				type = "executable",
				command = "flutter",
				args = { "debug_adapter" }
			}

			dap.configurations.dart = {
				{
					type = "dart",
					request = "launch",
					name = "Launch Flutter Program",
					program = "${file}",
					cwd = "${workspaceFolder}",
					-- toolArgs = { "-d", "linux" }
				}
			}
		end,
	},
}
