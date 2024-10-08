return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local M = {}

    telescope.setup({

      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            preview_cutoff = 0,
            preview_height = 0.6,
          },
        },
      },
    })

    -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#falling-back-to-find_files-if-git_files-cant-find-a-git-directory
    -- We cache the results of "git rev-parse"
    -- Process creation is expensive in Windows, so this reduces latency
    local is_inside_work_tree = {}

    M.project_files = function()
      local opts = {} -- define here if you want to define something

      local cwd = vim.fn.getcwd()
      if is_inside_work_tree[cwd] == nil then
        vim.fn.system("git rev-parse --is-inside-work-tree")
        is_inside_work_tree[cwd] = vim.v.shell_error == 0
      end

      if is_inside_work_tree[cwd] then
        builtin.git_files(opts)
      else
        builtin.find_files(opts)
      end
    end

    vim.keymap.set("n", "<leader>ff", M.project_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
  end,
}
