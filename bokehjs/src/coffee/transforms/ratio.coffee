ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class RatioView extends ContinuumView
  attributes:
    class: "RatioView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class Ratio extends HasParent
  type : "Ratio"
  default_view: RatioView

class Ratios extends Collection
  model : Ratio

module.exports =
  Model: Ratio
  Collection: new Ratios()
