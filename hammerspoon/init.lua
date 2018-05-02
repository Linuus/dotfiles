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

-- defeat paste block

hs.hotkey.bind({"cmd", "alt"}, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

-- volume

hs.hotkey.bind({"cmd", "alt"}, "]", function() hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.current().volume + 5) end)
hs.hotkey.bind({"cmd", "alt"}, "[", function() hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.current().volume - 5) end)

-- spotify

hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'space', hs.spotify.displayCurrentTrack)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'p',     hs.spotify.play)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'o',     hs.spotify.pause)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'n',     hs.spotify.next)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'i',     hs.spotify.previous)
