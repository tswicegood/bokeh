HasParent = require "common/has_parent"
ContinuumView = require "common/continuum_view"
build_views = require "common/build_views"
Collection = require "common/collection"

class VBoxView extends ContinuumView
  tag : "div"
  attributes:
    class : "bk-vbox"
  initialize : (options) ->
    super(options)
    @views = {}
    @render()
    @listenTo(@model, 'change', @render)
  render: () ->
    children = @mget('children')
    build_views(@views, children)
    for own key, val of @views
      val.$el.detach()
    @$el.empty()
    width = @mget("width")
    if width? then @$el.css(width: width + "px")
    height = @mget("height")
    if height? then @$el.css(height: height + "px")
    for child in children
      @$el.append(@views[child.id].$el)

class VBox extends HasParent
  type : "VBox"
  default_view : VBoxView
  defaults: ->
    return _.extend {}, super(), {
      children: []
    }

class VBoxes extends Collection
  model : VBox
vboxes = new VBoxes()

module.exports =
  Model: VBox
  Collection: vboxes
  View: VBoxView
