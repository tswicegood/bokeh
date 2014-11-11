Collection = require "common/collection"
build_views = require "common/build_views"
ContinuumView = require "common/continuum_view"
HasParent = require "common/has_parent"
Logging = require "common/logging"
template = require "./textinputtemplate.eco"

logger = Logging.logger

class TextInputView extends ContinuumView
  tagName : "div"
  attributes :
     class : "bk-widget-form-group"
  template : template
  events :
    "change input" : "change_input"

  change_input : () ->
    value = @$('input').val()
    logger.debug("textinput: value = #{value}")
    @mset('value', value)
    @model.save()

  initialize : (options) ->
    super(options)
    @render()
    @listenTo(@model, 'change', @render)

  render : () ->
    @$el.html(@template(@model.attributes))
    return @

class TextInput extends HasParent
  type : "TextInput"
  default_view : TextInputView

  defaults: ->
    return _.extend {}, super(), {
      name: ""
      value: ""
      title: ""
    }

class TextInputs extends Collection
  model : TextInput

module.exports =
  Model: TextInput
  Collection: new TextInputs()
