ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class SeqView extends ContinuumView
  attributes:
    class: "SeqView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class Seq extends HasParent
  type : "Seq"
  default_view: SeqView

class Seqs extends Collection
  model : Seq

module.exports =
  Model: Seq
  Collection: new Seqs()
