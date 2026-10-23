-- auto-save-state.lua
-- Description: Automatically saves MPV playback state periodically.

local auto_save_interval_sec = 600

mp.add_periodic_timer(auto_save_interval_sec, function()
  if mp.get_property_bool("seekable") then
    mp.command("write-watch-later-config")
  end
end)
