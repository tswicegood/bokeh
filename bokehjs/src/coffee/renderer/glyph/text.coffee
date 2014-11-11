_ = require "underscore"
Glyph = require "./glyph"

class TextView extends Glyph.View

  _fields: ['x', 'y', 'angle', 'text:string']
  _properties: ['text']

  _map_data: () ->
    [@sx, @sy] = @renderer.map_to_screen(@x, @glyph.x.units, @y, @glyph.y.units)

  _render: (ctx, indices) ->
    for i in indices
      if isNaN(@sx[i] + @sy[i] + @angle[i])
        continue

      ctx.translate(@sx[i], @sy[i])
      ctx.rotate(@angle[i])

      @props.text.set_vectorize(ctx, i)
      ctx.fillText(@text[i], 0, 0)

      ctx.rotate(-@angle[i])
      ctx.translate(-@sx[i], -@sy[i])

  draw_legend: (ctx, x1, x2, y1, y2) ->
    ctx.save()
    reference_point = @get_reference_point()
    if reference_point?
      glyph_settings = reference_point
    else
      glyph_settings = @props
    text_props = @props.text
    text_props.set(ctx, glyph_settings)
    # override some features so we fit inside the legend
    ctx.font = text_props.font(12)
    ctx.textAlign = "right"
    ctx.textBaseline = "middle"
    ctx.fillText("txt", x2, (y1+y2)/2)
    ctx.restore()

class Text extends Glyph.Model
  default_view: TextView
  type: 'Text'

  display_defaults: ->
    return _.extend {}, super(), {
      text_font: "helvetica"
      text_font_size: "12pt"
      text_font_style: "normal"
      text_color: "#444444"
      text_alpha: 1.0
      text_align: "left"
      text_baseline: "bottom"
    }

class Texts extends Glyph.Collection
  model: Text

module.exports =
  Model: Text
  View: TextView
  Collection: new Texts()
