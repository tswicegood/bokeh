ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class HDAlphaView extends ContinuumView
  attributes:
    class: "HDAlphaView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class HDAlpha extends HasParent
  type : "HDAlpha"
  default_view: HDAlphaView

class HDAlphas extends Collection
  model : HDAlpha

module.exports =
  Model: HDAlpha
  Collection: new HDAlphas()
