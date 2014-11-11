ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class CuberootView extends ContinuumView
  attributes:
    class: "CuberootView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class Cuberoot extends HasParent
  type : "Cuberoot"
  default_view: CuberootView

class Cuberoots extends Collection
  model : Cuberoot

module.exports =
  Model: Cuberoot
  Collection: new Cuberoots()
