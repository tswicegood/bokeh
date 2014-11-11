_ = require "underscore"
Collection = require "common/collection"
Axis = require "./axis"
LogTicker = require "ticking/log_ticker"
LogTickFormatter = require "ticking/log_tick_formatter"

class LogAxisView extends Axis.View

class LogAxis extends Axis.Model
  default_view: LogAxisView
  type: 'LogAxis'

  initialize: (attrs, objects) ->
    super(attrs, objects)
    if not @get('ticker')?
      @set_obj('ticker', LogTicker.Collection.create())
    if not @get('formatter')?
      @set_obj('formatter', LogTickFormatter.Collection.create())

class LogAxes extends Collection
   model: LogAxis

module.exports =
  Model: LogAxis
  Collection: new LogAxes()
  View: LogAxisView
