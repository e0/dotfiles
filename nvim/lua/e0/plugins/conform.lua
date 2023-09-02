return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will use the first available formatter in the list
				javascript = { "prettier_d", "prettier" },
				typescript = { "prettier_d", "prettier" },
				svelte = { "prettier_d", "prettier" },
				-- Formatters can also be specified with additional options
				python = {
					formatters = { "isort", "black" },
					-- Run formatters one after another instead of stopping at the first success
					run_all_formatters = true,
				},
			},
		})

		-- Format asynchronously on save
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ async = true, lsp_fallback = true, buf = args.buf }, function(err)
					if not err then
						vim.api.nvim_buf_call(args.buf, function()
							vim.cmd.update()
						end)
					end
				end)
			end,
		})
	end,
}
