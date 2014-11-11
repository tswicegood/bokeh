ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class NonZeroView extends ContinuumView
  attributes:
    class: "NonZeroView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class NonZero extends HasParent
  type : "NonZero"
  default_view: NonZeroView

class NonZeros extends Collection
  model : NonZero

module.exports =
  Model: NonZero
  Collection: new NonZeros()
