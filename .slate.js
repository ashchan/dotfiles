// Configs
S.cfga({
  "defaultToCurrentScreen" : true,
  "windowHintsShowIcons" : true,
  "windowHintsIgnoreHiddenWindows" : true,
  "windowHintsSpread" : true,
  "windowHintsDuration" : 2.5,
  "nudgePercentOf" : "screenSize",
  "resizePercentOf" : "screenSize",
  "secondsBetweenRepeat" : 0.1,
  "secondsBeforeRepeat" : 0.3,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000,
  "orderScreensLeftToRight" : true
});

// Monitors
var monU2311H = "0";
var monLaptop = "1440x900";

// 1 monitor layout
var oneMonitorLayout = S.lay("oneMonitor", {
  //"Messages" :chatHash,
  //"Terminal" : lapMainHash,
  //"Xcode" : lapMainHash,
  //"Safari" : lapMainHash,
  //"Spotify" : lapMainHash
});

var twoMonitorLayout = S.layout("twoMonitor", {
});

// Defaults
S.def(2, twoMonitorLayout);
S.def(1, oneMonitorLayout);

// Layout Operations
var twoMonitor = S.op("layout", { "name" : twoMonitorLayout });
var oneMonitor = S.op("layout", { "name" : oneMonitorLayout });
var universalLayout = function() {
  if (S.screenCount() === 2) {
    twoMonitor.run();
  } else if (S.screenCount() === 1) {
    oneMonitor.run();
  }
};

// Batch bind everything. Less typing.
S.bnda({
  // Layout Bindings
  //"padEnter:ctrl" : universalLayout,
  //"space:ctrl" : universalLayout,

  // Basic Location Bindings
  //"left:alt" : lapChat,
  //"right:alt" : lapMain,

  // Resize Bindings
  "right:cmd;shift" : S.op("resize", { "width" : "+5%", "height" : "+0" }),
  "left:cmd;shift" : S.op("resize", { "width" : "-5%", "height" : "+0" }),
  "up:cmd:shift" : S.op("resize", { "width" : "+0", "height" : "-5%" }),
  "down:cmd;shift" : S.op("resize", { "width" : "+0", "height" : "+5%" }),
  //"right:alt" : S.op("resize", { "width" : "-5%", "height" : "+0", "anchor" : "bottom-right" }),
  //"left:alt" : S.op("resize", { "width" : "+5%", "height" : "+0", "anchor" : "bottom-right" }),
  "up:alt" : S.op("resize", { "width" : "+0", "height" : "+5%", "anchor" : "bottom-right" }),
  "down:alt" : S.op("resize", { "width" : "+0", "height" : "-5%", "anchor" : "bottom-right" }),

  // Push Bindings
  "right:cmd" : S.op("push", { "direction" : "right", "style" : "bar-resize:screenSizeX/2" }),
  "left:cmd" : S.op("push", { "direction" : "left", "style" : "bar-resize:screenSizeX/2" }),
  "up:cmd" : S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY/2" }),
  "down:cmd" : S.op("push", { "direction" : "down", "style" : "bar-resize:screenSizeY/2" }),

  // Nudge Bindings
  "right:shift;alt" : S.op("nudge", { "x" : "+5%", "y" : "+0" }),
  "left:shift;alt" : S.op("nudge", { "x" : "-5%", "y" : "+0" }),
  "up:shift;alt" : S.op("nudge", { "x" : "+0", "y" : "-5%" }),
  "down:shift;alt" : S.op("nudge", { "x" : "+0", "y" : "+5%" }),

  // Throw Bindings
  "pad1:ctrl;alt" : S.op("throw", { "screen" : "2", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "pad2:ctrl;alt" : S.op("throw", { "screen" : "1", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "pad3:ctrl;alt" : S.op("throw", { "screen" : "0", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "right:ctrl;alt;cmd" : S.op("throw", { "screen" : "right", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "left:ctrl;alt;cmd" : S.op("throw", { "screen" : "left", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "up:ctrl;alt;cmd" : S.op("throw", { "screen" : "up", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "down:ctrl;alt;cmd" : S.op("throw", { "screen" : "down", "width" : "screenSizeX", "height" : "screenSizeY" }),

  // Hint and grid
  "esc:cmd" : S.op("hint"),
  "esc:ctrl" : S.op("grid")
});
