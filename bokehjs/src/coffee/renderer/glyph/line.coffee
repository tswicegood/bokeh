_ = require "underscore"
Properties = require "renderer/properties"
Glyph = require "./glyph"

class LineView extends Glyph.View

  _fields: ['x', 'y']
  _properties: ['line']

  _map_data: () ->
    [@sx, @sy] = @renderer.map_to_screen(@x, @glyph.x.units, @y, @glyph.y.units)

  _render: (ctx, indices) ->
    drawing = false
    @props.line.set(ctx, @props)

    for i in indices
      if isNaN(@sx[i] + @sy[i]) and drawing
        ctx.stroke()
        ctx.beginPath()
        drawing = false
        continue

      if drawing
        ctx.lineTo(@sx[i], @sy[i])
      else
        ctx.beginPath()
        ctx.moveTo(@sx[i], @sy[i])
        drawing = true

    if drawing
      ctx.stroke()

  draw_legend: (ctx, x0, x1, y0, y1) ->
    @_generic_line_legend(ctx, x0, x1, y0, y1)

class Line extends Glyph.Model
  default_view: LineView
  type: 'Line'

  display_defaults: ->
    return _.extend {}, super(), @line_defaults

class Lines extends Glyph.Collection
  model: Line

module.exports =
  Model: Line
  View: LineView
  Collection: new Lines()
