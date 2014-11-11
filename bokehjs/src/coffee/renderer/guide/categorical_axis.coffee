Collection = require "common/collection"
Axis = require "./axis"
Logging = require "common/logging"
FactorRange = require "range/factor_range"
CategoricalTicker = require "ticking/categorical_ticker"
CategoricalTickFormatter = require "ticking/categorical_tick_formatter"

logger = Logging.logger

class CategoricalAxisView extends Axis.View

class CategoricalAxis extends Axis.Model
  default_view: CategoricalAxisView
  type: 'CategoricalAxis'

  initialize: (attrs, objects) ->
    super(attrs, objects)
    if not @get('ticker')?
      @set_obj('ticker', CategoricalTicker.Collection.create())
    if not @get('formatter')?
      @set_obj('formatter', CategoricalTickFormatter.Collection.create())

  _bounds: () ->
    i = @get('dimension')
    ranges = [@get('plot').get('x_range'), @get('plot').get('y_range')]

    user_bounds = @get('bounds') ? 'auto'
    if user_bounds != 'auto'
      logger.warn("Categorical Axes only support user_bounds='auto', ignoring")

    range_bounds = [ranges[i].get('min'), ranges[i].get('max')]

    return range_bounds

class CategoricalAxes extends Collection
  model: CategoricalAxis

module.exports =
  Model: CategoricalAxis
  Collection: new CategoricalAxes()
  View: CategoricalAxisView
