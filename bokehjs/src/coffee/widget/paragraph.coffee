HasParent = require "common/has_parent"
ContinuumView = require "common/continuum_view"
Collection = require "common/collection"

class ParagraphView extends ContinuumView
  tagName : "p"
  initialize : (options) ->
    super(options)
    @render()
    @listenTo(@model, 'change', @render)
  render: () ->
    if @mget('height')
      @$el.height(@mget('height'))
    if @mget('width')
      @$el.width(@mget('width'))
    @$el.text(@mget('text'))
class Paragraph extends HasParent
  type : "Paragraph"
  default_view : ParagraphView
  defaults: ->
    return _.extend {}, super(), {
      text: ''
    }

class Paragraphs extends Collection
  model : Paragraph
paragraphs = new Paragraphs()

module.exports =
  Model: Paragraph
  Collection: paragraphs
  View: ParagraphView
