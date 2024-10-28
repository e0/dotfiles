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
    return 'Selenized Dark (Gogh)'
  else
    return 'Selenized Light (Gogh)'
  end
end

config.font = wezterm.font 'Martian Mono VF'
config.font_size = 12
config.freetype_load_target = "Normal"
config.freetype_render_target = "HorizontalLcd"
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.adjust_window_size_when_changing_font_size = false

config.color_scheme = scheme_for_appearance(get_appearance())
config.colors = {
  tab_bar = {
    background = "rgba(0, 0, 0, 0.2)",    -- Light opacity to blend into background
    active_tab = {
      bg_color = "rgba(50, 50, 50, 0.6)", -- Active tab color with reduced opacity
      fg_color = "#ffffff",
    },
    inactive_tab = {
      bg_color = "rgba(30, 30, 30, 0.2)", -- Inactive tab color with transparency
      fg_color = "#888888",
    },
    inactive_tab_hover = {
      bg_color = "rgba(40, 40, 40, 0.3)", -- Hover color for a subtle highlight effect
      fg_color = "#bbbbbb",
    },
  }
}
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.inactive_pane_hsb = {
  saturation = 1.0,
  brightness = 1.0,
}
-- iTerm2-like keybindings
config.keys = {
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

  -- Pane navigation (Option + Arrow keys)
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'OPT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'OPT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },

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

return config
