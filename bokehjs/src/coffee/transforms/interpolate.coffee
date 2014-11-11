ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class InterpolateView extends ContinuumView
  attributes:
    class: "InterpolateView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class Interpolate extends HasParent
  type : "Interpolate"
  default_view: InterpolateView

class Interpolates extends Collection
  model : Interpolate

module.exports =
  Model: Interpolate
  Collection: new Interpolates()
