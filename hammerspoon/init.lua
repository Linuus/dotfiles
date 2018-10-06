hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
end)
hs.alert.show("Config loaded")

hs.hotkey.bind({"cmd", "ctrl"}, "Return", function()
  hs.execute("open -n -a emacs", true)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "b", function()
  hs.execute("open -a qutebrowser", true)
end)
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "b", function()
  hs.execute("open -n -a qutebrowser", true)
end)

hs.hotkey.bind({"cmd", "alt"}, "h", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f, 0)
end)

hs.hotkey.bind({"cmd", "alt"}, "l", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f, 0)
end)

hs.hotkey.bind({"cmd", "alt"}, "k", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f, 0)
end)

hs.hotkey.bind({"cmd", "alt"}, "j", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f, 0)
end)

hs.hotkey.bind({"cmd", "alt"}, "f", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f, 0)
end)

-- window switcher
-- works best if only one space is used, otherwise ordering is messed up sometimes.
-- TODO: try to fix ordering between spaces.
switcher = hs.window.switcher.new() -- default windowfilter: only visible windows, all Spaces
switcher.ui.textColor = {1, 1, 1}
switcher.ui.highlightColor = {0.4, 0.4, 0.4, 0.7}
switcher.ui.backgroundColor = {0.4, 0.4, 0.4, 0.6}
switcher.ui.titleBackgroundColor = {0, 0, 0, 0}
switcher.ui.showThumbnails = false
switcher.ui.showSelectedThumbnail = false
switcher.ui.fontName = "System"
switcher.ui.textSize = 14
switcher.ui.showSelectedTitle = false

-- bind to hotkeys; WARNING: at least one modifier key is required!
hs.hotkey.bind("alt","tab",function()switcher:next()end)
hs.hotkey.bind("alt-shift","tab",function()switcher:previous()end)

-- defeat paste block

hs.hotkey.bind({"cmd", "alt"}, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

-- volume

hs.hotkey.bind({"cmd", "alt"}, "]", function() hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.current().volume + 5) end)
hs.hotkey.bind({"cmd", "alt"}, "[", function() hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.current().volume - 5) end)

-- spotify

hs.hotkey.bind({"cmd", "alt"}, 'c', hs.spotify.displayCurrentTrack)
hs.hotkey.bind({"cmd", "alt"}, 'p', hs.spotify.playpause)
hs.hotkey.bind({"cmd", "alt"}, '.', hs.spotify.next)
hs.hotkey.bind({"cmd", "alt"}, ',', hs.spotify.previous)
