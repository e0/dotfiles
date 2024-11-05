return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require("lualine")

    local function get_lualine_theme()
      if vim.o.background == 'light' then
        return 'gruvbox_light'
      else
        return 'gruvbox-material'
      end
    end

    local options = {
      icons_enabled = true,
      theme = get_lualine_theme(),
    }

    local sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    }

    local config = {
      options = options,
      sections = sections,
    }

    lualine.setup(config)

    -- Create an autocommand to update the theme when background changes
    vim.api.nvim_create_autocmd("OptionSet", {
      pattern = "background",
      callback = function()
        config.options.theme = get_lualine_theme()
        lualine.setup(config)
      end,
    })
  end,
}
