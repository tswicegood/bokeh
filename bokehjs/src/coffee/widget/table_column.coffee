HasProperties = require "common/has_properties"
Collection = require "common/collection"

class TableColumn extends HasProperties
  type: 'TableColumn'
  default_view: null

class TableColumns extends Collection
  model: TableColumn

module.exports =
  Model: TableColumn
  Collection: new TableColumns()
