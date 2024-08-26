return {
  "folke/trouble.nvim",
  config = function()
    local trouble = require("trouble")
    trouble.setup({})

    vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle focus=true<cr>", { noremap = true, silent = true })
  end,
}
