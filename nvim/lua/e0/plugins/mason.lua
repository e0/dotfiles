return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup()

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "pyright",
        "jsonls",
        "rust_analyzer", -- :MasonInstall codelldb
      },
      -- automatically enable installed servers via vim.lsp.enable()
      automatic_enable = true, -- this replaces the old automatic_installation option
    })
  end,
}
