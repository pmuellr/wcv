!function(e){if("object"==typeof exports&&"undefined"!=typeof module)module.exports=e();else if("function"==typeof define&&define.amd)define([],e);else{var f;"undefined"!=typeof window?f=window:"undefined"!=typeof global?f=global:"undefined"!=typeof self&&(f=self),f.wcv=e()}}(function(){var define,module,exports;return (function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(_dereq_,module,exports){
var Column, View;

View = _dereq_("./View");

module.exports = Column = (function() {
  function Column(ws) {
    var elemSource;
    this.ws = ws;
    elemSource = "<div class=\"wcv-column-shell\">\n  <div class=\"wcv-column-header\"></div>\n  <div class=\"wcv-column\">\n    <div class=\"wcv-view-edge\"></div>\n  </div>\n</div>";
    this.elem = $(elemSource)[0];
    this.views = [];
    this.collapsed = false;
  }

  Column.prototype.addView = function() {
    var view;
    view = new View(this);
    this.views.push(view);
    $(".wcv-column", this.elem).append(view.elem);
    $(".wcv-column", this.elem).append($("<div class='wcv-view-edge'></div>"));
    return view;
  };

  return Column;

})();


},{"./View":2}],2:[function(_dereq_,module,exports){
var View;

module.exports = View = (function() {
  function View(col) {
    var elemSource;
    this.col = col;
    elemSource = "<div class=\"wcv-view-shell\">\n  <div class=\"wcv-view-header\"></div>\n  <div class=\"wcv-view\"></div>\n</div>";
    this.elem = $(elemSource)[0];
    this.collapsed = false;
  }

  return View;

})();


},{}],3:[function(_dereq_,module,exports){
var Column, Workspace;

Column = _dereq_("./Column");

module.exports = Workspace = (function() {
  function Workspace() {
    var elemSource;
    elemSource = "<div class=\"wcv-workspace-shell\">\n  <div class=\"wcv-workspace-header\"></div>\n  <div class=\"wcv-workspace\">\n    <div class=\"wcv-column-edge\"></div>\n  </div>\n</div>";
    this.elem = $(elemSource)[0];
    this.columns = [];
  }

  Workspace.prototype.addColumn = function() {
    var column;
    column = new Column(this);
    this.columns.push(column);
    $(".wcv-workspace", this.elem).append(column.elem);
    $(".wcv-workspace", this.elem).append($("<div class='wcv-column-edge'></div>"));
    return column;
  };

  return Workspace;

})();


},{"./Column":1}],4:[function(_dereq_,module,exports){
module.exports = '/* Licensed under the MIT License. See the LICENSE file for details. */\n\n.wcv-workspace-shell {\n  height:           100%;\n\n  margin:           0;\n}\n\n.wcv-workspace-shell, .wcv-column-shell, .wcv-view-shell {\n  display:          flex;\n  flex-direction:   column;\n  justify-content:  space-around;\n  align-items:      stretch;\n\n  flex:             1 1 0;\n\n  overflow:         hidden;\n}\n\n.wcv-workspace-header, .wcv-column-header, .wcv-view-header {\n  flex:             0 0 auto;\n}\n\n.wcv-column-edge, .wcv-view-edge {\n  flex:             0 0 10px;\n}\n\n.wcv-workspace, .wcv-column {\n  display:          flex;\n  justify-content:  space-around;\n  align-items:      stretch;\n\n  flex:             1 1 0;\n\n  height:           100%;\n}\n\n.wcv-workspace {\n  flex-direction:   row;\n}\n\n.wcv-column {\n  flex-direction:   column;\n}\n\n.wcv-view {\n  flex:             1 1 0;\n}\n';


},{}],5:[function(_dereq_,module,exports){
var Workspace, cssInjected, injectCSS, wcv;

Workspace = _dereq_("./Workspace");

wcv = exports;

cssInjected = false;

wcv.createWorkspace = function() {
  if (!cssInjected) {
    cssInjected = true;
    injectCSS();
  }
  return new Workspace;
};

injectCSS = function() {
  var css;
  css = _dereq_("./wcv-css");
  return $("head").append("<style>" + css + "</style>");
};


},{"./Workspace":3,"./wcv-css":4}]},{},[5])
// sourceMappingURL annotation removed by cat-source-map
(5)
});

//# sourceMappingURL=wcv.js.map.json