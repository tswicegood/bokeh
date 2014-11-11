Collection = require "common/collection"
_ = require "underscore"
ContinuumView = require "common/continuum_view"
HasParent = require "common/has_parent"
Logging = require "common/logging"
template = require "./selecttemplate.eco"

logger = Logging.logger

class SelectView extends ContinuumView
  tagName : "div"
  template : template
  events :
    "change select" : "change_input"

  change_input : () ->
    value = @$('select').val()
    logger.debug("selectbox: value = #{value}")
    @mset('value', value)
    @model.save()

  initialize : (options) ->
    super(options)
    @render()
    @listenTo(@model, 'change', @render)

  render : () ->
    @$el.empty()
    html = @template(@model.attributes)
    @$el.html(html)
    return this

class Select extends HasParent
  type : "Select"
  default_view : SelectView

  defaults: ->
    return _.extend {}, super(), {
      title: ''
      value: ''
      options: []
    }

class Selects extends Collection
  model : Select

module.exports =
  Model : Select
  Collection : new Selects()
  View : SelectView
