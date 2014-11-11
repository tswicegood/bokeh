Collection = require "common/collection"
HasProperties = require "common/has_properties"

class CategoricalTicker extends HasProperties
  type: 'CategoricalTicker'

  get_ticks: (start, end, range, {desired_n_ticks}) ->
    return {
      "major": range.get("factors")
      "minor": []
    }

class CategoricalTickers extends Collection
  model: CategoricalTicker

module.exports =
  Model: CategoricalTicker
  Collection: new CategoricalTickers()
