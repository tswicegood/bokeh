ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class LogView extends ContinuumView
  attributes:
    class: "LogView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class Log extends HasParent
  type : "Log"
  default_view: LogView

class Logs extends Collection
  model : Log

module.exports =
  Model: Log
  Collection: new Logs()
