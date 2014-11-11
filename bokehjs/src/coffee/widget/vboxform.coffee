HasParent = require "common/has_parent"
ContinuumView = require "common/continuum_view"
build_views = require "common/build_views"
Collection = require "common/collection"

class VBoxFormView extends ContinuumView
  tagName : "form"
  attributes:
    class : "bk-widget-form"
    role : "form"

  initialize : (options) ->
    super(options)
    @views = {}
    @render()

  render: () ->
    children = @mget('children')
    build_views(@views, children)
    for own key, val of @views
      val.$el.detach()
    @$el.empty()
    for child in children
      @$el.append("<br/")
      @$el.append(@views[child.id].$el)

class VBoxForm extends HasParent
  type : "VBoxForm"
  default_view : VBoxFormView
  defaults: ->
    return _.extend {}, super(), {
      children: []
    }

class VBoxForms extends Collection
  model : VBoxForm
vboxforms = new VBoxForms()

module.exports =
  "Model" : VBoxForm
  "Collection" : vboxforms
  "View" : VBoxFormView
