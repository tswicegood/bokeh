Collection = require "common/collection"
AdaptiveTicker = require "ticking/adaptive_ticker"

class BasicTicker extends AdaptiveTicker.Model
  type: 'BasicTicker'

  initialize: (attrs, options) ->
    super(attrs, options)

  defaults: ->
    return _.extend {}, super(), {
      mantissas: [1,2,5]
    }

class BasicTickers extends Collection
  model: BasicTicker

module.exports =
  Model: BasicTicker
  Collection: new BasicTickers()
