ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class ToCountsView extends ContinuumView
  attributes:
    class: "ToCountsView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class ToCounts extends HasParent
  type : "ToCounts"
  default_view: ToCountsView

class ToCountss extends Collection
  model : ToCounts

module.exports =
  Model: ToCounts
  Collection: new ToCountss()
