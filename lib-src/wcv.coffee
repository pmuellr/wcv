# Licensed under the MIT License. See the LICENSE file for details.

Workspace = require "./Workspace"

wcv = exports

cssInjected = false

#-------------------------------------------------------------------------------
wcv.createWorkspace = ->

  unless cssInjected
    cssInjected = true
    injectCSS()

  return new Workspace

#-------------------------------------------------------------------------------
injectCSS = ->
  css = require("./wcv-css")
  $("head").append("<style>#{css}</style>")
