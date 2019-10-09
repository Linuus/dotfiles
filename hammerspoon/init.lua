local hyper = {"cmd", "alt"}
local launcher = {"cmd", "ctrl"}
local launcher_2 = {"cmd", "ctrl", "shift"}
hs.window.animationDuration = 0

hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall:andUse("MiroWindowsManager", {
                             hotkeys =
                                {
                                   up = {hyper, "k"},
                                   right = {hyper, "l"},
                                   down = {hyper, "j"},
                                   left = {hyper, "h"},
                                   fullscreen = {hyper, "f"}
                                }
})

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
end)
hs.alert.show("Config loaded")

hs.hotkey.bind(launcher, "e", function()
   hs.osascript.applescript([[
      on emacsRunning()
         tell application "System Events" to (name of processes) contains "emacs"
      end emacsRunning

      on run argv

      if (emacsRunning() = false) then
         do shell script "open -a emacs " & (item 1 of argv)
      else
         tell application "emacs" to activate
      end if
      end run
   ]])
end)

hs.hotkey.bind(launcher_2, "e", function()
  hs.execute("open -n -a emacs", true)
end)

hs.hotkey.bind(launcher, "f", function()
   hs.osascript.applescript([[
      on firefoxRunning()
         tell application "System Events" to (name of processes) contains "Firefox"
      end firefoxRunning

      on run argv

      if (firefoxRunning() = false) then
         do shell script "open -a Firefox " & (item 1 of argv)
      else
         tell application "Firefox" to activate
      end if
      end run
   ]])
end)

hs.hotkey.bind(launcher, "b", function()
  hs.execute("open -a qutebrowser", true)
end)

-- defeat paste block
hs.hotkey.bind(hyper, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

-- volume
hs.hotkey.bind(
   hyper,
   "]",
   function()
      hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.current().volume + 5)
end)
hs.hotkey.bind(
   hyper,
   "[",
   function()
      hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.current().volume - 5)
end)

-- spotify
hs.hotkey.bind(hyper, "c", hs.spotify.displayCurrentTrack)
hs.hotkey.bind(hyper, "p", hs.spotify.playpause)
hs.hotkey.bind(hyper, ".", hs.spotify.next)
hs.hotkey.bind(hyper, ",", hs.spotify.previous)
