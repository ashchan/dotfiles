dofile(package.searchpath("grid", package.path))
dofile(package.searchpath("win", package.path))

hydra.alert "Hydra loaded."

pathwatcher.new(os.getenv("HOME") .. "/.dotify/.hydra/", hydra.reload):start()
autolaunch.set(true)

menu.show(function()
    return {
      {title = "Reload Config", fn = hydra.reload},
      {title = "-"},
      {title = "About", fn = hydra.showabout},
      {title = "Quit Hydra", fn = os.exit},
    }
end)

local mash = {"cmd", "shift"}

local function opendictionary()
    application.launchorfocus("Dictionary")
end
hotkey.bind(mash, 'D', opendictionary)

hotkey.bind(mash, 'M', ext.grid.fullscreen)
hotkey.bind(mash, 'N', ext.grid.center)

hotkey.bind(mash, 'H', ext.grid.lefthalf)
hotkey.bind(mash, 'L', ext.grid.righthalf)
hotkey.bind(mash, ',', ext.grid.leftchunk)
hotkey.bind(mash, '.', ext.grid.rightchunk)

fnutils.each({ "up", "down", "left", "right" }, function(direction)
  hotkey.bind(mash, direction, dowin(ext.win.push, direction))
end)

local cash = {"cmd", "ctrl"}
hotkey.bind(cash, 'left', ext.grid.topleft)
hotkey.bind(cash, 'up', ext.grid.topright)
hotkey.bind(cash, 'right', ext.grid.bottomright)
hotkey.bind(cash, 'down', ext.grid.bottomleft)

hotkey.bind(mash, 'X', logger.show)
hotkey.bind(mash, "R", repl.open)

