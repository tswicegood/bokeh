ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class BinarySegmentView extends ContinuumView
  attributes:
    class: "BinarySegmentView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class BinarySegment extends HasParent
  type : "BinarySegment"
  default_view: BinarySegmentView

class BinarySegments extends Collection
  model : BinarySegment

module.exports =
  Model: BinarySegment
  Collection: new BinarySegments()
