return {
	"akinsho/flutter-tools.nvim",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		local on_attach = function(_, bufnr)
			local map = vim.keymap.set
			local wk = require("which-key")
			map("n", "<leader>xc", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })

			wk.add({ "<leader>F", group = "Flutter" })
			map("n", "<leader>Fs", "<cmd>FlutterRun<cr>", { desc = "Flutter Start" })
			map("n", "<leader>Fd", "<cmd>FlutterDevices<cr>", { desc = "Flutter Devices" })
			map("n", "<leader>Fe", "<cmd>FlutterEmulators<cr>", { desc = "Flutter Emulators" })
			map("n", "<leader>Fr", "<cmd>FlutterReload<cr>", { desc = "Flutter Reload" })
			map("n", "<leader>FR", "<cmd>FlutterRestart<cr>", { desc = "Flutter Restart" })
			map("n", "<leader>Fq", "<cmd>FlutterQuit<cr>", { desc = "Flutter Quit" })
			map("n", "<leader>FD", "<cmd>FlutterDetach<cr>", { desc = "Flutter Detach" })
			map("n", "<leader>Fv", "<cmd>FlutterDevTools<cr>", { desc = "Flutter Dev Tools" })
			map("n", "<leader>FV", "<cmd>FlutterDevToolsActivate<cr>", { desc = "Flutter Dev Tools Activate" })
			map("n", "<leader>Fe", "<cmd>FlutterRename<cr>", { desc = "Flutter Rename" })

			wk.add({ "<leader>Fo", group = "Flutter Outline" })
			map("n", "<leader>Fot", "<cmd>FlutterOutlineToggle<cr>", { desc = "Flutter Outline Toggle" })
			map("n", "<leader>Fot", "<cmd>FlutterOutlineOpen<cr>", { desc = "Flutter Outline Open" })

			function Jump_to_Test()
				local current_file = vim.fn.expand("%:t:r")
				local target_file

				if current_file:match("_test$") then
					target_file = vim.fn.substitute(current_file, "_test$", "", "") .. ".dart"
				else
					target_file = current_file .. "_test.dart"
				end

				local result = vim.fn.system("fd " .. target_file .. " | head -n 1")

				if result and result ~= "" then
					vim.cmd("edit " .. vim.fn.trim(result))
				else
					print("File not found: " .. target_file)
				end
			end

			map("n", "<C-T>", "<cmd>lua Jump_to_Test()<cr>", { desc = "Jump to Test" })
		end

		require("flutter-tools").setup({
			flutter_lookup_cmd = "asdf where flutter",
			widget_guides = { enabled = true },
			debugger = {
				enabled = true,
				run_via_dap = true,
				exception_breakpoints = {},
				register_configurations = function(paths)
					local dap = require("dap")
					dap.adapters.dart = {
						type = "executable",
						command = paths.flutter_bin,
						args = { "debug-adapter" },
					}
					-- dap.configurations.dart = {}
					-- require("dap.ext.vscode").load_launchjs()
				end,
			},
			lsp = {
				settings = {
					showtodos = true,
					completefunctioncalls = true,
					analysisexcludedfolders = {
						vim.fn.expand("$Home/.pub-cache"),
					},
					renamefileswithclasses = "prompt",
					updateimportsonrename = true,
					enablesnippets = true,
				},
				on_attach = on_attach,
			},
		})
	end,
}
