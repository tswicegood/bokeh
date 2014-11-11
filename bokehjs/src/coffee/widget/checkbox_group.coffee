_ = require "underscore"
Collection = require "common/collection"
ContinuumView = require "common/continuum_view"
HasParent = require "common/has_parent"
Logging = require "common/logging"

logger = Logging.logger

class CheckboxGroupView extends ContinuumView
  tagName: "div"
  events:
    "change input": "change_input"

  change_input: () ->
    active = (i for checkbox, i in @$("input") when checkbox.checked)
    @mset('active', active)
    @model.save()

  initialize: (options) ->
    super(options)
    @render()
    @listenTo(@model, 'change', @render)

  render: () ->
    @$el.empty()

    active = @mget("active")
    for label, i in @mget("labels")
      $input = $('<input type="checkbox">').attr(value: "#{i}")
      if @mget("disabled") then $input.prop("disabled", true)
      if i in active then $input.prop("checked", true)

      $label = $('<label></label>').text(label).prepend($input)
      if @mget("inline")
          $label.addClass("bk-bs-checkbox-inline")
          @$el.append($label)
      else
          $div = $('<div class="bk-bs-checkbox"></div>').append($label)
          @$el.append($div)

    return @

class CheckboxGroup extends HasParent
  type: "CheckboxGroup"
  default_view: CheckboxGroupView

  defaults: ->
    return _.extend {}, super(), {
      active: []
      labels: []
      inline: false
      disabled: false
    }

class CheckboxGroups extends Collection
  model: CheckboxGroup

module.exports =
  Model: CheckboxGroup
  Collection: new CheckboxGroups()
  View: CheckboxGroupView
