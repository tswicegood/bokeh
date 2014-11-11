_ = require "underscore"
Collection = require "common/collection"
$ = require "jquery"
$1 = require "bootstrap/button"
ContinuumView = require "common/continuum_view"
HasParent = require "common/has_parent"
Logging = require "common/logging"

logger = Logging.logger

class RadioButtonGroupView extends ContinuumView
  tagName: "div"
  events:
    "change input": "change_input"

  change_input: () ->
    active = (i for radio, i in @$("input") when radio.checked)
    @mset('active', active[0])
    @model.save()

  initialize: (options) ->
    super(options)
    @render()
    @listenTo(@model, 'change', @render)

  render: () ->
    @$el.empty()

    @$el.addClass("bk-bs-btn-group")
    @$el.attr("data-bk-bs-toggle", "buttons")

    name = _.uniqueId("RadioButtonGroup")
    active = @mget("active")
    for label, i in @mget("labels")
      $input = $('<input type="radio">').attr(name: name, value: "#{i}")
      if i == active then $input.prop("checked", true)
      $label = $('<label class="bk-bs-btn"></label>')
      $label.text(label).prepend($input)
      $label.addClass("bk-bs-btn-" + @mget("type"))
      if i == active then $label.addClass("bk-bs-active")
      @$el.append($label)

    return @

class RadioButtonGroup extends HasParent
  type: "RadioButtonGroup"
  default_view: RadioButtonGroupView

  defaults: ->
    return _.extend {}, super(), {
      active: null
      labels: []
      type: "default"
      disabled: false
    }

class RadioButtonGroups extends Collection
  model: RadioButtonGroup

module.exports =
  Model: RadioButtonGroup
  Collection: new RadioButtonGroups()
  View: RadioButtonGroupView
