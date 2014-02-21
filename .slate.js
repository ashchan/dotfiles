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
var monTboltL = "0";
var monTboltR = "2";
var monLaptop = "1440x900";

// Operations
var lapChat = S.op("corner", {
  "screen" : monLaptop,
  "direction" : "top-left",
  "width" : "screenSizeX/4",
  "height" : "screenSizeY"
});
var lapMain = lapChat.dup({ "direction" : "top-right", "width" : "3*screenSizeX/4" });
var tboltLFull = S.op("move", {
  "screen" : monTboltL,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});
var tboltLLeft = tboltLFull.dup({ "width" : "screenSizeX/3" });
var tboltLMid = tboltLLeft.dup({ "x" : "screenOriginX+screenSizeX/3" });
var tboltLRight = tboltLLeft.dup({ "x" : "screenOriginX+(screenSizeX*2/3)" });
var tboltLLeftTop = tboltLLeft.dup({ "height" : "screenSizeY/2" });
var tboltLLeftBot = tboltLLeftTop.dup({ "y" : "screenOriginY+screenSizeY/2" });
var tboltLMidTop = tboltLMid.dup({ "height" : "screenSizeY/2" });
var tboltLMidBot = tboltLMidTop.dup({ "y" : "screenOriginY+screenSizeY/2" });
var tboltLRightTop = tboltLRight.dup({ "height" : "screenSizeY/2" });
var tboltLRightBot = tboltLRightTop.dup({ "y" : "screenOriginY+screenSizeY/2" });
var tboltRFull = S.op("move", {
  "screen" : monTboltR,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});
var tboltRLeft = tboltRFull.dup({ "width" : "screenSizeX/3" });
var tboltRMid = tboltRLeft.dup({ "x" : "screenOriginX+screenSizeX/3" });
var tboltRRight = tboltRLeft.dup({ "x" : "screenOriginX+(screenSizeX*2/3)" });
var tboltRLeftTop = tboltRLeft.dup({ "height" : "screenSizeY/2" });
var tboltRLeftBot = tboltRLeftTop.dup({ "y" : "screenOriginY+screenSizeY/2" });
var tboltRMidTop = tboltRMid.dup({ "height" : "screenSizeY/2" });
var tboltRMidBot = tboltRMidTop.dup({ "y" : "screenOriginY+screenSizeY/2" });
var tboltRRightTop = tboltRRight.dup({ "height" : "screenSizeY/2" });
var tboltRRightBot = tboltRRightTop.dup({ "y" : "screenOriginY+screenSizeY/2" });

// common layout hashes
var lapMainHash = {
  "operations" : [lapMain],
  "ignore-fail" : true,
  "repeat" : true
};
var chatHash = {
  "operations" : [lapChat, lapMain],
  "ignore-fail" : true,
  "title-order" : ["Buddies"],
  "repeat-last" : true
};
var terminalHash = {
  "operations" : [tboltLMidTop, tboltLMidBot, tboltRMidTop, tboltRMidBot, tboltRRightBot],
  "sort-title" : true,
  "repeat" : true
};
var genBrowserHash = function(regex) {
  return {
    "operations" : [function(windowObject) {
      var title = windowObject.title();
      if (title !== undefined && title.match(regex)) {
        windowObject.doOperation(tboltLLeft);
      } else {
        windowObject.doOperation(lapMain);
      }
    }],
    "ignore-fail" : true,
    "repeat" : true
  };
};

// 1 monitor layout
var oneMonitorLayout = S.lay("oneMonitor", {
  "Messages" :chatHash,
  "Terminal" : lapMainHash,
  "Xcode" : lapMainHash,
  "Safari" : lapMainHash,
  "Spotify" : lapMainHash
});

var twoMonitorLayout = S.lay("twoMonitor", {
  "Terminal" : terminalHash,
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
  "left:alt" : lapChat,
  "right:alt" : lapMain,

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

  // Focus Bindings
  //"l:cmd" : S.op("focus", { "direction" : "right" }),
  //"h:cmd" : S.op("focus", { "direction" : "left" }),
  //"k:cmd" : S.op("focus", { "direction" : "up" }),
  //"j:cmd" : S.op("focus", { "direction" : "down" }),
  //"k:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  //"j:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  //"right:cmd" : S.op("focus", { "direction" : "right" }),
  //"left:cmd" : S.op("focus", { "direction" : "left" }),
  //"up:cmd" : S.op("focus", { "direction" : "up" }),
  //"down:cmd" : S.op("focus", { "direction" : "down" }),
  //"up:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  //"down:cmd;alt" : S.op("focus", { "direction" : "behind" }),

  // Window Hints
  "esc:cmd" : S.op("hint"),

  // Switch currently doesn't work well so I'm commenting it out until I fix it.
  //"tab:cmd" : S.op("switch"),

  // Grid
  "esc:ctrl" : S.op("grid")
});
