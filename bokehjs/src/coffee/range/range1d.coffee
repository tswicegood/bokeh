_ = require "underscore"
Collection = require "common/collection"
HasProperties = require "common/has_properties"

class Range1d extends HasProperties
  type: 'Range1d'
  initialize: (attrs, options) ->
    super(attrs, options)
    @register_property('min',
        () -> Math.min(@get('start'), @get('end'))
      , true)
    @add_dependencies('min', this, ['start', 'end'])
    @register_property('max',
        () ->
          Math.max(@get('start'), @get('end'))
      , true)
    @add_dependencies('max', this, ['start', 'end'])

  defaults: ->
    return _.extend {}, super(), {
      start: 0
      end: 1
    }

class Range1ds extends Collection
  model: Range1d

module.exports =
  Model: Range1d
  Collection: new Range1ds()
