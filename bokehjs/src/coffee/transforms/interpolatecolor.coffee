ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class InterpolateColorView extends ContinuumView
  attributes:
    class: "InterpolateColorView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class InterpolateColor extends HasParent
  type : "InterpolateColor"
  default_view: InterpolateColorView

class InterpolateColors extends Collection
  model : InterpolateColor

module.exports =
  Model: InterpolateColor
  Collection: new InterpolateColors()
