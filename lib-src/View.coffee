# Licensed under the MIT License. See the LICENSE file for details.

#-------------------------------------------------------------------------------
module.exports = class View

  #-----------------------------------------------------------------------------
  constructor: (@col) ->
    elemSource = """
      <div class="wcv-view-shell">
        <div class="wcv-view-header"></div>
        <div class="wcv-view"></div>
      </div>
    """

    @elem      = $(elemSource)[0]
    @collapsed = false
