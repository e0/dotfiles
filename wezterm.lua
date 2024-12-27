local wezterm = require 'wezterm'

local config = wezterm.config_builder()

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Gruvbox Material (Gogh)'
  else
    return 'Gruvbox (Gogh)'
  end
end

local function get_tab_bar_colors(appearance)
  if appearance:find 'Dark' then
    return {
      background = "rgba(0, 0, 0, 1)",
      active_tab = {
        bg_color = "rgba(50, 50, 50, 0.9)",
        fg_color = "#ffffff",
      },
    }
  else
    return {
      background = "rgba(255, 255, 255, 0.2)",
      active_tab = {
        bg_color = "rgba(230, 230, 230, 0.6)",
        fg_color = "#000000",
      },
    }
  end
end

-- Set up an event handler to update colors when appearance changes
wezterm.on('window-config-reloaded', function(window)
  local appearance = window:get_appearance()
  local colors = get_tab_bar_colors(appearance)
  window:set_config_overrides({
    colors = { tab_bar = colors }
  })
end)


local appearance = get_appearance()


config.font = wezterm.font('MartianMono Nerd Font', {
  weight = "Medium", stretch = "Condensed"
})
config.font_size = 14
config.line_height = 1.2
config.freetype_load_target = "Normal"
config.freetype_render_target = "HorizontalLcd"
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.adjust_window_size_when_changing_font_size = false

config.window_decorations = 'RESIZE'


config.colors = {
  tab_bar = get_tab_bar_colors(appearance)
}
config.color_scheme = scheme_for_appearance(appearance)
config.use_fancy_tab_bar = false
config.inactive_pane_hsb = {
  saturation = 1.0,
  brightness = 1.0,
}
-- iTerm2-like keybindings
config.keys = {
  -- Full screen using CMD + Enter
  {
    key = 'Return',
    mods = 'CMD',
    action = wezterm.action.ToggleFullScreen,
  },

  -- Pane splitting
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'D',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- Move to the next pane
  { key = "]", mods = "CMD", action = wezterm.action { ActivatePaneDirection = "Next" } },

  -- Move to the previous pane
  { key = "[", mods = "CMD", action = wezterm.action { ActivatePaneDirection = "Prev" } },


  -- Close tab/pane (CMD + W)
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },

  -- Clear screen (CMD + K)
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
  },

  -- Search (CMD + F)
  {
    key = 'F',
    mods = 'CMD',
    action = wezterm.action.Search 'CurrentSelectionOrEmptyString',
  },
}


-- move tabs
for i = 1, 8 do
  -- CTRL+ALT + number to move to that position
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL|ALT',
    action = wezterm.action.MoveTab(i - 1),
  })
end

return config
