ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class ConstView extends ContinuumView
  attributes:
    class: "ConstView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class Const extends HasParent
  type : "Const"
  default_view: ConstView

class Consts extends Collection
  model : Const

module.exports =
  Model: Const
  Collection: new Consts()
