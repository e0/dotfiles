return {
  "maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local solarized = require("solarized")
    solarized.setup({
      transparent = true,
      palette = 'selenized',
      theme = "neo"
    })
    vim.cmd([[colorscheme solarized]])
  end,
}
