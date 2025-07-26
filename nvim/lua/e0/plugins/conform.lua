return {
  "stevearc/conform.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters = {
        svelte_fmt = {
          command = "prettier",
          args = { "--plugin", "prettier-plugin-svelte", "$FILENAME" },
        },
      },

      formatters_by_ft = {
        -- lua = { "stylua" },
        -- Conform will use the first available formatter in the list
        javascript = { "prettier" },
        typescript = { "prettier" },
        svelte = { "svelte_fmt" },
        -- Formatters can also be specified with additional options
        python = {
          formatters = { "isort", "black" },
          -- Run formatters one after another instead of stopping at the first success
          run_all_formatters = true,
        },
        sql = { "sql_formatter" },
      },
    })

    -- Format asynchronously on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ async = false, lsp_fallback = true, buf = args.buf })
      end,
    })
  end,
}
