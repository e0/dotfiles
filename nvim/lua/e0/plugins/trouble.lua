return {
	"folke/trouble.nvim",
	config = function()
		local trouble = require("trouble")
		trouble.setup({
			icons = false,
			height = 15,
			fold_open = "v", -- icon used for open folds
			fold_closed = ">", -- icon used for closed folds
			indent_lines = false, -- add an indent guide below the fold icons
			signs = {
				error = "E",
				warning = "W",
				hint = "H",
				information = "I",
			},
			use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client,
		})

		vim.keymap.set("n", "<C-S-t>", trouble.toggle, {})
	end,
}
