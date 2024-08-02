return {
  "ribru17/bamboo.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require('bamboo').setup {
      -- optional configuration here
    }
    require('bamboo').load()
    vim.o.background = "light"
    vim.cmd("colorscheme bamboo")
  end,
}
