ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class CountView extends ContinuumView
  attributes:
    class: "CountView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class Count extends HasParent
  type : "Count"
  default_view: CountView

class Counts extends Collection
  model : Count

module.exports =
  Model: Count
  Collection: new Counts()
