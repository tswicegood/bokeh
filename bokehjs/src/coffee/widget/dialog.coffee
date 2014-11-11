_ = require "underscore"
Collection = require "common/collection"
$ = require "jquery"
$1 = require "bootstrap/modal"
HasProperties = require "common/has_properties"
ContinuumView = require "common/continuum_view"
dialog_template = require "./dialog_template.eco"

class DialogView extends ContinuumView

  initialize: (options) ->
    super(options)
    @render()
    @listenTo(@model, 'destroy', @remove)
    @listenTo(@model, 'change:visible', @changeVisibility)
    @listenTo(@model, 'change:content', @changeContent)

  render: () ->
    @$modal = $(dialog_template(@model.attributes))
    @$modal.modal({show: @mget("visible")})
    @$modal.on('hidden.bk-bs.modal', @onHide)
    @$el.html(@$modal)

  onHide: (event) =>
    @mset("visible", false, {silent: true})

  changeVisibility: () =>
    @$modal.modal(if @mget("visible") then "show" else "hide")

  changeContent: () =>
    @$modal.find(".bk-bs-modal-body").text(@mget("content"))

class Dialog extends HasProperties
  type: "Dialog"
  default_view: DialogView
  defaults: ->
    return _.extend {}, super(), {
      visible: false
      closable: true
      title: ""
      content: ""
      buttons: []
    }

class Dialogs extends Collection
  model: Dialog

module.exports =
  Model: Dialog
  Collection: new Dialogs()
  View: DialogView
