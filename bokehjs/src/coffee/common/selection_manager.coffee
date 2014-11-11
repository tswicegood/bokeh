_ = require "underscore"
HasProperties = require "./has_properties"
Logging = require "./logging"
Selector = require "./selector"

logger = Logging.logger

class SelectionManager extends HasProperties
  type: 'SelectionManager'

  initialize: (attrs, options) ->
    super(attrs, options)
    @selectors = {}

  set_selection: (indices) ->
    @_save_indices(indices)
    source.trigger('select')

  select: (tool, renderer_view, geometry, final, append=false) ->
    source = @get('source')
    if source != renderer_view.mget('data_source')
      logger.warn('select called with mis-matched data sources')

    indices = renderer_view.hit_test(geometry)

    selector = @_get_selector(tool)
    selector.update(indices, final, append)

    @_save_indices(selector.get('indices'))
    source.trigger('select')
    source.trigger('select-' + renderer_view.mget('id'))

  inspect: (tool, renderer_view, geometry, data) ->
    source = @get('source')
    if source != renderer_view.mget('data_source')
      logger.warn('inspect called with mis-matched data sources')

    indices = renderer_view.hit_test(geometry)

    if indices?
      source.trigger(
        'inspect', indices, tool, renderer_view, source, data
      )
      source.trigger(
        'inspect' + renderer_view.mget('id'), indices, tool, renderer_view, source, data
      )

  clear: (tool) ->
    if tool?
      selector = @_get_selector(tool)
      selector.clear()
    @_save_indices([])

  _get_selector: (tool) ->
    _.setdefault(@selectors, tool.model.id, new Selector())
    return @selectors[tool.model.id]

  _save_indices: (indices) ->
    @get('source').save({
      "selected": indices
    }, {patch: true})

module.exports = SelectionManager
