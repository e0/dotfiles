return {
	"lifepillar/vim-solarized8",
	branch = "neovim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.o.background = "light"
		vim.cmd([[colorscheme solarized8]])
	end,
}
