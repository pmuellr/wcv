# Licensed under the MIT License. See the LICENSE file for details.

View = require "./View"

#-------------------------------------------------------------------------------
module.exports = class Column

  #-----------------------------------------------------------------------------
  constructor: (@ws) ->
    elemSource = """
      <div class="wcv-column-shell">
        <div class="wcv-column-header"></div>
        <div class="wcv-column">
          <div class="wcv-view-edge"></div>
        </div>
      </div>
    """

    @elem      = $(elemSource)[0]
    @views     = []
    @collapsed = false

  #-----------------------------------------------------------------------------
  addView: () ->
    view = new View @
    @views.push view

    $(".wcv-column", @elem).append view.elem
    $(".wcv-column", @elem).append $("<div class='wcv-view-edge'></div>")

    return view
