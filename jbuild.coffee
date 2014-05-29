# Licensed under the MIT License. See the LICENSE file for details.

path = require "path"

ToolsDir = "tools"

#-------------------------------------------------------------------------------
# use this file with jbuild: https://www.npmjs.org/package/jbuild
# install jbuild with:
#    linux/mac: sudo npm -g install jbuild
#    windows:        npm -g install jbuild
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
tasks = defineTasks exports,
  watch: "watch for source file changes, then run build, test and server"
  serve: "run the test server stand-alone"
  build: "build the server"
  test:  "run tests"

WatchSpec = "lib-src lib-src/* tests tests/*"

#-------------------------------------------------------------------------------
mkdir "-p", "tmp"

#-------------------------------------------------------------------------------
tasks.build = ->
  initTools()

  log "running build"

  unless test "-d", "node_modules"
    exec "npm install"

  unless test "-d", "bower_components"
    exec "bower install jquery#2.1.x"

  cleanDir "lib"

  # log "- compiling server coffee files"
  # coffee "--output lib lib-src"

  css = cat "lib-src/wcv.css"
  css = "'''\n#{css}\n'''"
  cssModule = """
    #-----------------------------------------------------------------------------
    # file generated from wcv.css
    #-----------------------------------------------------------------------------

    module.exports = #{css}
  """
  cssModule.to "lib-src/wcv-css.coffee"

  options =
    outfile:    "tmp/wcv.js"
    entry:      "lib-src/wcv"
    standalone: "wcv"
    debug:      "true"
    transform:  "coffeeify"
    extension:  ".coffee"

  options = for key, val of options
    "--#{key} #{val}"

  options = options.join " "

  browserify options

  catSourceMap "--fixFileNames tmp/wcv.js lib/wcv.js"

#-------------------------------------------------------------------------------
tasks.watch = ->
  watchIter()

  watch
    files: WatchSpec.split " "
    run:   watchIter

  watchFiles "jbuild.coffee" :->
    log "jbuild file changed; exiting"
    process.exit 0

#-------------------------------------------------------------------------------
tasks.test = ->
  initTools()

  log "running tests"

  tests = "tests/test-*.coffee"

  options =
    ui:         "bdd"
    reporter:   "spec"
    slow:       300
    compilers:  "coffee:coffee-script"
    require:    "coffee-script/register"

  options = for key, val of options
    "--#{key} #{val}"

  options = options.join " "

  mocha "#{options} #{tests}", silent:true, (code, output) ->
    console.log "test results:\n#{output}"

#-------------------------------------------------------------------------------
initTools = ->
  return if initTools.initialized
  initTools.initialized = true

  unless test "-d", path.join(ToolsDir, "node_modules")
    origDir = process.cwd()
    process.chdir ToolsDir
    exec "npm install"
    process.chdir origDir

  defineModuleFunctions ToolsDir

  global.catSourceMap = global["cat-source-map"]

#-------------------------------------------------------------------------------
watchIter = ->
  tasks.build()
  tasks.test()

#-------------------------------------------------------------------------------
cleanDir = (dir) ->
  mkdir "-p", dir
  rm "-rf", "#{dir}/*"
