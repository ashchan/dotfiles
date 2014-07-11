-- https://github.com/szymonkaliski/Dotfiles/blob/master/Dotfiles/hydra.lua

-- extensions
ext.frame = {}
ext.win = {}

-- window margins and positions
ext.win.margin = 0
ext.win.positions = {}

-- returns frame pushed to screen edge
function ext.frame.push(screen, direction)
  local frames = {
    [ "up" ] = function()
      return {
        x = ext.win.margin + screen.x,
        y = ext.win.margin + screen.y,
        w = screen.w - ext.win.margin * 2,
        h = screen.h / 2 - ext.win.margin
      }
    end,

    [ "down" ] = function()
      return {
        x = ext.win.margin + screen.x,
        y = ext.win.margin * 3 / 4 + screen.h / 2 + screen.y,
        w = screen.w - ext.win.margin * 2,
        h = screen.h / 2 - ext.win.margin * (2 - 1 / 4)
      }
    end,

    [ "left" ] = function()
      return {
        x = ext.win.margin + screen.x,
        y = ext.win.margin + screen.y,
        w = screen.w / 2 - ext.win.margin * (2 - 1 / 4),
        h = screen.h - ext.win.margin * (2 - 1 / 4)
      }
    end,

    [ "right" ] = function()
      return {
        x = ext.win.margin / 2 + screen.w / 2 + screen.x,
        y = ext.win.margin + screen.y,
        w = screen.w / 2 - ext.win.margin * (2 - 1 / 4),
        h = screen.h - ext.win.margin * (2 - 1 / 4)
      }
    end
  }

  return frames[direction]()
end

-- returns frame moved by ext.win.margin
function ext.frame.nudge(frame, screen, direction)
  local modifyframe = {
    [ "up" ] = function(frame)
      frame.y = math.max(screen.y + ext.win.margin, frame.y - ext.win.margin)
      return frame
    end,

    [ "down" ] = function(frame)
      frame.y = math.min(screen.y + screen.h - frame.h - ext.win.margin * 3 / 4, frame.y + ext.win.margin)
      return frame
    end,

    [ "left" ] = function(frame)
      frame.x = math.max(screen.x + ext.win.margin, frame.x - ext.win.margin)
      return frame
    end,

    [ "right" ] = function(frame)
      frame.x = math.min(screen.x + screen.w - frame.w - ext.win.margin, frame.x + ext.win.margin)
      return frame
    end
  }

  return modifyframe[direction](frame)
end

-- returns frame fited inside screen
function ext.frame.fit(screen, frame)
  frame.w = math.min(frame.w, screen.w - ext.win.margin * 2)
  frame.h = math.min(frame.h, screen.h - ext.win.margin * (2 - 1 / 4))

  return frame
end

-- returns frame centered inside screen
function ext.frame.center(screen, frame)
  frame.x = screen.w / 2 - frame.w / 2 + screen.x
  frame.y = screen.h / 2 - frame.h / 2 + screen.y

  return frame
end

-- ugly fix for problem with window height when it's as big as screen
function ext.win.fix(win)
  local screen = win:screen():frame_without_dock_or_menu()
  local frame = win:frame()

  if (frame.h > (screen.h - ext.win.margin * (2 - 1 / 4))) then
    frame.h = screen.h - ext.win.margin * 10
    win:setframe(frame)
  end
end

-- pushes window in direction and nudges to edge, fixes terminal positioning
function ext.win.push(win, direction)
  local screen = win:screen():frame_without_dock_or_menu()
  local frame

  frame = ext.frame.push(screen, direction)
  frame = ext.frame.nudge(frame, screen, direction)

  ext.win.fix(win)
  win:setframe(frame)
end

-- nudges window in direction
function ext.win.nudge(win, direction)
  local screen = win:screen():frame_without_dock_or_menu()
  local frame = win:frame()

  frame = ext.frame.nudge(frame, screen, direction)

  win:setframe(frame)
end

-- centers window
function ext.win.center(win)
  local screen = win:screen():frame_without_dock_or_menu()
  local frame = win:frame()

  frame = ext.frame.center(screen, frame)

  win:setframe(frame)
end

-- fullscreen window with ext.win.margin
function ext.win.full(win)
  local screen = win:screen():frame_without_dock_or_menu()
  local frame = {
    x = ext.win.margin + screen.x,
    y = ext.win.margin + screen.y,
    w = screen.w - ext.win.margin * 2,
    h = screen.h - ext.win.margin * (2 - 1 / 4)
  }

  ext.win.fix(win)
  win:setframe(frame)
end

-- throw to next screen, center and fit
function ext.win.throw(win)
  local screen = win:screen():next():frame_without_dock_or_menu()
  local frame = win:frame()

  frame.x = screen.x
  frame.y = screen.y

  frame = ext.frame.fit(screen, frame)
  frame = ext.frame.center(screen, frame)

  ext.win.fix(win)
  win:setframe(frame)
  win:focus()
end

-- set window size and center
function ext.win.size(win, size)
  local screen = win:screen():frame_without_dock_or_menu()
  local frame = win:frame()

  frame.w = size.w
  frame.h = size.h

  frame = ext.frame.fit(screen, frame)
  frame = ext.frame.center(screen, frame)

  win:setframe(frame)
end

-- save and restore window positions
function ext.win.pos(win, option)
  local id = win:application():bundleid()
  local frame = win:frame()

  -- saves window position if not saved before
  if option == "save" and not ext.win.positions[id] then
    ext.win.positions[id] = frame
  end

  -- force update saved window position
  if option == "update" then
    ext.win.positions[id] = frame
  end

  -- restores window position
  if option == "load" and ext.win.positions[id] then
    win:setframe(ext.win.positions[id])
  end
end

-- cycle application windows
-- simplified and stolen from: https://github.com/nifoc/dotfiles/blob/master/hydra/cycle.lua
function ext.win.cycle(win)
  local windows = win:application():visiblewindows()
  windows = fnutils.filter(windows, function(win) return win:isstandard() end)

  if #windows >= 2 then
    table.sort(windows, function(a, b) return a:id() < b:id() end)
    local activewindowindex = fnutils.indexof(windows, win)

    if activewindowindex then
      activewindowindex = activewindowindex + 1
      if activewindowindex > #windows then activewindowindex = 1 end

      windows[activewindowindex]:focus()
    end
  end
end

-- apply function to a window with optional params, saving it's position for restore
function dowin(fn, param)
  return function()
    local win = window.focusedwindow()

    ext.win.pos(win, "save")
    fn(win, param)
  end
end
