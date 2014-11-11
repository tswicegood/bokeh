Backbone = require "backbone"
HasProperties = require "common/has_properties"
Logging = require "common/logging"

logger = Logging.logger

class ToolEvents extends HasProperties
   type: 'ToolEvents'

class ToolEventsCollection extends Backbone.Collection
  model : ToolEvents

module.exports =
  Model: ToolEvents
  Collection: new ToolEventsCollection()
