-- Basic settings
vim.o.number = true
vim.o.syntax = "enable"
vim.o.clipboard = "unnamedplus"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.mouse = "a"
vim.o.backspace = "indent,eol,start"
vim.o.backupcopy = "yes"
vim.o.termguicolors = true

-- Set colorscheme
vim.cmd([[colorscheme desert]])

-- Initialize lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-lua/plenary.nvim",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
	},
	"mg979/vim-visual-multi",
	"github/copilot.vim",
	"leafOfTree/vim-svelte-plugin",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"stevearc/conform.nvim",
	"nvim-lualine/lualine.nvim",
	{
		"lifepillar/vim-solarized8",
		branch = "neovim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.o.background = "light"

			vim.cmd.colorscheme("solarized8")
		end,
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-k>", builtin.live_grep, {})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"html",
		"svelte",
		"lua_ls",
		"sourcery",
		"tsserver",
		"tailwindcss",
		"jsonls",
	},
})

require("conform").setup({
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

-- Lualine
require("lualine").setup({
	options = {
		theme = "solarized_light",
	},
})

-- Globals
vim.g.vim_svelte_plugin_use_typescript = 1
