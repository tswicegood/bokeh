ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class ContourView extends ContinuumView
  attributes:
    class: "ContourView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class Contour extends HasParent
  type : "Contour"
  default_view: ContourView

class Contours extends Collection
  model : Contour

module.exports =
  Model: Contour
  Collection: new Contours()
