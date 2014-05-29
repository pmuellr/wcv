# Licensed under the MIT License. See the LICENSE file for details.

Column = require "./Column"

#-------------------------------------------------------------------------------
module.exports = class Workspace

  #-----------------------------------------------------------------------------
  constructor: () ->
    elemSource = """
      <div class="wcv-workspace-shell">
        <div class="wcv-workspace-header"></div>
        <div class="wcv-workspace">
          <div class="wcv-column-edge"></div>
        </div>
      </div>
    """

    @elem    = $(elemSource)[0]
    @columns = []

  #-----------------------------------------------------------------------------
  addColumn: () ->
    column = new Column @
    @columns.push column

    $(".wcv-workspace", @elem).append column.elem
    $(".wcv-workspace", @elem).append $("<div class='wcv-column-edge'></div>")

    return column
