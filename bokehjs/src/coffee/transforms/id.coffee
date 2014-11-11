ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class IdView extends ContinuumView
  attributes:
    class: "IdView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class Id extends HasParent
  type : "Id"
  default_view: IdView

class Ids extends Collection
  model : Id

module.exports =
  Model: Id
  Collection: new Ids()
