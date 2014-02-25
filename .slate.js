S.configAll({
  "defaultToCurrentScreen":         true,
  "checkDefaultsOnLoad":            true,
  "orderScreensLeftToRight":        true,
  "windowHintsShowIcons":           true,
  "windowHintsSpread":              true
});

var oneMonitorLayout = S.layout("oneMonitor", {
  "Messages": {},
  "Terminal": {},
  "Xcode": {},
  "Safari": {},
  "Spotify": {},
  "TODO Simulator": {}
});

var twoMonitorLayout = S.layout("twoMonitor", {
});

S.default(2, twoMonitorLayout);
S.default(1, oneMonitorLayout);

var twoMonitor = S.operation("layout", { "name" : twoMonitorLayout });
var oneMonitor = S.operation("layout", { "name" : oneMonitorLayout });
var universalLayout = function() {
  if (S.screenCount() === 2) {
    twoMonitor.run();
  } else if (S.screenCount() === 1) {
    oneMonitor.run();
  }
};

S.bindAll({
  // Layout Bindings
  //"padEnter:ctrl" : universalLayout,
  //"space:ctrl" : universalLayout,

  // Basic Location Bindings
  //"left:alt" : lapChat,
  //"right:alt" : lapMain,

  "m:shift;cmd": S.op("move", { x: "screenOriginX", y: "screenOriginY", width: "screenSizeX", height: "screenSizeY" }),

  "right:cmd": S.op("push", { "direction" : "right", "style" : "bar-resize:screenSizeX/2" }),
  "left:cmd": S.op("push", { "direction" : "left", "style" : "bar-resize:screenSizeX/2" }),
  "up:cmd": S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY/2" }),
  "down:cmd": S.op("push", { "direction" : "down", "style" : "bar-resize:screenSizeY/2" }),

  "right:cmd;shift": S.op("resize", { "width" : "+5%", "height" : "+0" }),
  "left:cmd;shift": S.op("resize", { "width" : "-5%", "height" : "+0" }),
  "up:cmd:shift": S.op("resize", { "width" : "+0", "height" : "-5%" }),
  "down:cmd;shift": S.op("resize", { "width" : "+0", "height" : "+5%" }),
  "up:alt": S.op("resize", { "width" : "+0", "height" : "+5%", "anchor" : "bottom-right" }),
  "down:alt": S.op("resize", { "width" : "+0", "height" : "-5%", "anchor" : "bottom-right" }),

  "right:shift;alt": S.op("nudge", { "x" : "+5%", "y" : "+0" }),
  "left:shift;alt": S.op("nudge", { "x" : "-5%", "y" : "+0" }),
  "up:shift;alt": S.op("nudge", { "x" : "+0", "y" : "-5%" }),
  "down:shift;alt": S.op("nudge", { "x" : "+0", "y" : "+5%" }),

  "up:shift;cmd": S.op("throw", { "screen" : "2", "width" : "screenSizeX", "height" : "screenSizeY" }),

  "esc:cmd": S.op("hint"),
  "esc:ctrl": S.op("grid")
});
