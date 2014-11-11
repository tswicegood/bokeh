_ = require "underscore"
$ = require "jquery"
Collection = require "common/collection"
HasProperties = require "common/has_properties"

class TableColumn extends HasProperties
  type: 'TableColumn'
  default_view: null

class TableColumns extends Collection
  model: TableColumn

module.exports =
  Model : TableColumn
  Collection: new TableColumns()
