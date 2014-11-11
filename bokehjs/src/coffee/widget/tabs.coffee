_ = require "underscore"
$ = require "jquery"
$1 = require "bootstrap/tab"
Collection = require "common/collection"
ContinuumView = require "common/continuum_view"
HasProperties = require "common/has_properties"
build_views = require "common/build_views"
tabs_template = require "./tabs_template.eco"

class TabsView extends ContinuumView

  initialize : (options) ->
    super(options)
    @views = {}
    @render()

  render: () ->
    for own key, val of @views
      val.$el.detach()
    @$el.empty()

    tabs = @mget('tabs')
    active = @mget("active")

    children = (tab.get("child") for tab in tabs)
    build_views(@views, children)

    html = $(tabs_template({
      tabs: tabs
      active: (i) -> if i == active then 'bk-bs-active' else ''
    }))

    html.find("> li > a").click (event) ->
      event.preventDefault()
      $(this).tab('show')

    $panels = html.children(".bk-bs-tab-pane")

    for [child, panel] in _.zip(children, $panels)
      $(panel).html(@views[child.id].$el)

    @$el.append(html)
    @$el.tabs

class Tabs extends HasProperties
  type: "Tabs"
  default_view: TabsView
  defaults: ->
    return _.extend {}, super(), {
      tabs: []
      active: 0
    }

class Tabses extends Collection
  model: Tabs

module.exports =
  Model: Tabs
  Collection: new Tabses()
  View: TabsView
