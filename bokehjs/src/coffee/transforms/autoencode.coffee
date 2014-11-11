ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class AutoEncodeView extends ContinuumView
  attributes:
    class: "AutoEncodeView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class AutoEncode extends HasParent
  type : "AutoEncode"
  default_view: AutoEncodeView

class AutoEncodes extends Collection
  model : AutoEncode

module.exports =
  Model: AutoEncode
  Collection: new AutoEncodes()
