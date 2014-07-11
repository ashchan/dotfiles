ext.grid = {}
ext.grid.BORDER = 2

function ext.grid.fullscreen()
  local win = window.focusedwindow()

  local screenframe = ext.grid.screenframe(win)
  win:setframe(screenframe)
end

function ext.grid.lefthalf()
  local win = window.focusedwindow()

  local screenframe = ext.grid.screenframe(win)
  local newframe = {
    x = screenframe.x,
    y = screenframe.y,
    w = screenframe.w / 2 - ext.grid.BORDER,
    h = screenframe.h,
  }

  win:setframe(newframe)
end

function ext.grid.righthalf()
  local win = window.focusedwindow()

  local screenframe = ext.grid.screenframe(win)
  local newframe = {
    x = screenframe.x + screenframe.w / 2 + ext.grid.BORDER,
    y = screenframe.y,
    w = screenframe.w / 2 - ext.grid.BORDER,
    h = screenframe.h,
  }

  win:setframe(newframe)
end

function ext.grid.topleft()
  local win = window.focusedwindow()

  local screenframe = ext.grid.screenframe(win)
  local newframe = {
    x = screenframe.x,
    y = screenframe.y,
    w = screenframe.w / 2 - ext.grid.BORDER,
    h = screenframe.h / 2 - ext.grid.BORDER,
  }

  win:setframe(newframe)
end

function ext.grid.bottomleft()
  local win = window.focusedwindow()

  local screenframe = ext.grid.screenframe(win)
  local newframe = {
    x = screenframe.x,
    y = screenframe.y + screenframe.h / 2 + ext.grid.BORDER,
    w = screenframe.w / 2 - ext.grid.BORDER,
    h = screenframe.h / 2 - ext.grid.BORDER,
  }

  win:setframe(newframe)
end

function ext.grid.topright()
  local win = window.focusedwindow()

  local screenframe = ext.grid.screenframe(win)
  local newframe = {
    x = screenframe.x + screenframe.w / 2 + ext.grid.BORDER,
    y = screenframe.y,
    w = screenframe.w / 2 - ext.grid.BORDER,
    h = screenframe.h / 2 - ext.grid.BORDER,
  }

  win:setframe(newframe)
end

function ext.grid.bottomright()
  local win = window.focusedwindow()

  local screenframe = ext.grid.screenframe(win)
  local newframe = {
    x = screenframe.x + screenframe.w / 2 + ext.grid.BORDER,
    y = screenframe.y + screenframe.h / 2 + ext.grid.BORDER,
    w = screenframe.w / 2 - ext.grid.BORDER,
    h = screenframe.h / 2 - ext.grid.BORDER,
  }

  win:setframe(newframe)
end

function ext.grid.pushwindow()
  local win = window.focusedwindow()

  local winframe = win:frame()
  local nextscreen = win:screen():next()
  local screenframe = nextscreen:frame_without_dock_or_menu()
  local newframe = {
    x = screenframe.x,
    y = screenframe.y,
    w = winframe.w,
    h = winframe.h,
  }

  win:setframe(newframe)
end

function ext.grid.center()
  local win = window.focusedwindow()

  local winframe = win:frame()
  local screenframe = ext.grid.screenframe(win)
  local newframe = {
    x = screenframe.w / 2 - winframe.w / 2,
    y = screenframe.h / 2 - winframe.h / 2,
    w = winframe.w,
    h = winframe.h,
  }

  win:setframe(newframe)
end

function ext.grid.screenframe(win)
  return win:screen():frame_without_dock_or_menu()
end

-- Customized versions of lefthalf() and righthalf() that make the left side slightly wider:
function ext.grid.leftchunk()
  local win = window.focusedwindow()
  if not win then return end

  local screenframe = ext.grid.screenframe(win)
  local newframe = {
    x = screenframe.x,
    y = screenframe.y,
    w = screenframe.w * 0.6 - ext.grid.BORDER,
    h = screenframe.h,
  }

  win:setframe(newframe)
end

function ext.grid.rightchunk()
  local win = window.focusedwindow()
  if not win then return end

  local screenframe = ext.grid.screenframe(win)
  local newframe = {
    x = screenframe.x + screenframe.w * 0.6 + ext.grid.BORDER,
    y = screenframe.y,
    w = screenframe.w * 0.4 - ext.grid.BORDER,
    h = screenframe.h,
  }

  win:setframe(newframe)
end