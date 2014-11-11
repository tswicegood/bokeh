ContinuumView = require "common/continuum_view"
Collection = require "common/collection"
HasParent = require "common/has_parent"

class CountCategoriesView extends ContinuumView
  attributes:
    class: "CountCategoriesView"

  initialize: (options) ->
    super(options)
    @render_init()

  delegateEvents: (events) ->
    super(events)
    "pass"

  render_init: () ->
    @$el.html("")

class CountCategories extends HasParent
  type : "CountCategories"
  default_view: CountCategoriesView

class CountCategoriess extends Collection
  model : CountCategories

module.exports =
  Model: CountCategories
  Collection: new CountCategoriess()
