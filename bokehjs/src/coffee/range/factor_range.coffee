Collection = require "common/collection",
HasProperties = require "common/has_properties"

class FactorRange extends HasProperties
  type: 'FactorRange'
  initialize: (attrs, options) ->
    super(attrs, options)
    @register_property('end',
        () -> @get('factors').length + 0.5
      , true)
    @add_dependencies('end', this, ['factors'])
    @register_property('min',
        () -> @get('start')
      , true)
    @add_dependencies('min', this, ['factors'])
    @register_property('max',
        () -> @get('end')
      , true)
    @add_dependencies('max', this, ['factors'])

  defaults: ->
    return _.extend {}, super(), {
      start: 0.5
      factors: []
    }

class FactorRanges extends Collection
  model: FactorRange

module.exports =
  Model: FactorRange
  Collection: new FactorRanges()
