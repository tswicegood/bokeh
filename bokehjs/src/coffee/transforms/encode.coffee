ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class EncodeView extends ContinuumView
  attributes:
    class: "EncodeView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class Encode extends HasParent
  type : "Encode"
  default_view: EncodeView

class Encodes extends Collection
  model : Encode

module.exports =
  Model: Encode
  Collection: new Encodes()
