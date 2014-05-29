# Licensed under the MIT License. See the LICENSE file for details.

expect = require("../tools")["expect.js"]

pkg = require "../package.json"

#-------------------------------------------------------------------------------
describe "package", ->

  #-----------------------------------------------------------------------------
  it "name should be a string", ->
    expect(pkg.name).to.be.a "string"

  #-----------------------------------------------------------------------------
  it "version should be a semver", ->
    expect(pkg.version).to.match /^\d+\.\d+\.\d+(.*)$/
