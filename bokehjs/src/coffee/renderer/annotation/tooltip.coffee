
define [
  "underscore"
  "common/has_parent"
  "common/plot_widget"
  "common/collection"
  "common/logging"
], (_, HasParent, PlotWidget, Collection, Logging) ->

  logger = Logging.logger

  class TooltipView extends PlotWidget
    className: "bk-tooltip"

    initialize: (options) ->
      super(options)
      # TODO (bev) really probably need multiple divs
      @$el.appendTo(@plot_view.$el.find('div.bk-canvas-overlays'))
      @$el.css({'z-index': 1010});
      @$el.hide()

    bind_bokeh_events: () ->
      @listenTo(@model, 'change:data', @_draw_tips)

    render: () ->
      @_draw_tips()

    _draw_tips: () ->
      @$el.empty()
      @$el.hide()

      if _.isEmpty(@mget('data'))
        return

      for val in @mget('data')
        [vx, vy, content] = val
        if @mget('inner_only') and not @plot_view.frame.contains(vx, vy)
            continue
        tip = $('<div />').appendTo(@$el)
        tip.append(content)
      sx = @plot_view.mget('canvas').vx_to_sx(vx)
      sy = @plot_view.mget('canvas').vy_to_sy(vy)

      side = @mget('side')
      if side == 'auto'
        ow = @plot_view.frame.get('width')
        if vx - @plot_view.frame.get('left') < ow/2
          side = 'right'
        else
          side = 'left'

      @$el.removeClass('right')
      @$el.removeClass('left')

      if side == "right"
        @$el.addClass("left")
        top  = sy - @$el.height()/2
        left = sx + 18
      else if side == "left"
        @$el.addClass("right")
        top  = sy - @$el.height()/2
        left = sx - @$el.width() - 23
      else
        logger.warn("invalid tooltip side: '#{side}'")
        return

      # TODO (bev) this is not currently bulletproof. If there are
      # two hits, not colocated and one is off the screen, that can
      # be problematic
      if @$el.children().length > 0
        @$el.css({top: top, left: left})
        @$el.show()

  class Tooltip extends HasParent
    default_view: TooltipView
    type: 'Tooltip'

    clear: () ->
      @set('data', [])

    add: (vx, vy, content) ->
      data = @get('data')
      data.push([vx, vy, content])
      @set('data', data)

    defaults: ->
      return _.extend {}, super(), {
        level: 'overlay'
        side: "auto"
        inner_only: true
      }

  class Tooltips extends Collection
    model: Tooltip

  return {
    "Model": Tooltip,
    "Collection": new Tooltips()
    "View": TooltipView,
  }
