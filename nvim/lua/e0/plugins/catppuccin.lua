return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      -- optional configuration here
    }
    vim.cmd("colorscheme catppuccin")
  end,
}
