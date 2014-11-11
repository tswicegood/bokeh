ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class SpreadView extends ContinuumView
  attributes:
    class: "SpreadView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class Spread extends HasParent
  type : "Spread"
  default_view: SpreadView

class Spreads extends Collection
  model : Spread

module.exports =
  Model: Spread
  Collection: new Spreads()
