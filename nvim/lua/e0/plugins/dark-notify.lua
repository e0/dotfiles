return {
  "cormacrelf/dark-notify",
  config = function()
    local dn = require("dark_notify")
    dn.run({})
    dn.update()
  end,
}
