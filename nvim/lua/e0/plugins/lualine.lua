return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine")
		local options = { icons_enabled = false, theme = "solarized_light" }
		local sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		}
		lualine.setup({
			options = options,
			sections = sections,
		})
	end,
}
