// Licensed under the MIT License. See the LICENSE file for details.

var pkg = require("./package.json")

for (var name in pkg.dependencies) {
  exports[name] = require(name)
}
