vim.cmd.colorscheme("catppuccin")

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = true,
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


local dapSigns = {
	DapBreakpoint = { "#f38ba8" },
	DapBreakpointCondition = { "#f9e2af" },
	DapLogPoint = { "#585b70" },
	DapStopped = { "#fab387" },
	DapBreakpointRejected = { "#cba6f7" }
}

for sign, color in pairs(dapSigns) do
	vim.cmd("hi " .. sign .. "Color guifg=" .. color[1])
	vim.fn.sign_define(sign, { text = "", texthl = sign .. "Color", linehl = "", numhl = "" })
end
