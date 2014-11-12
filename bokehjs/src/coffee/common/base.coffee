_ = require "underscore"

require "common/custom"
require "common/canvas"
require "common/cartesian_frame"
require "common/gmap_plot"
require "common/geojs_plot"
require "common/grid_plot"
require "common/layout_box"
require "common/plot"
require "common/plot_context"
require "common/selection_manager"
require "common/selector"
require "common/tool_events"

require "mapper/categorical_mapper"
require "mapper/linear_mapper"
require "mapper/log_mapper"
require "mapper/grid_mapper"
require "mapper/linear_color_mapper"

require "range/data_factor_range"
require "range/data_range1d"
require "range/factor_range"
require "range/range1d"

require "renderer/annotation/legend"
require "renderer/annotation/span"
require "renderer/annotation/tooltip"

require "renderer/glyph/glyph_renderer"

require "renderer/glyph/annular_wedge"
require "renderer/glyph/annulus"
require "renderer/glyph/arc"
require "renderer/glyph/bezier"
require "renderer/glyph/circle"
require "renderer/glyph/gear"
require "renderer/glyph/image"
require "renderer/glyph/image_rgba"
require "renderer/glyph/image_url"
require "renderer/glyph/line"
require "renderer/glyph/multi_line"
require "renderer/glyph/oval"
require "renderer/glyph/patch"
require "renderer/glyph/patches"
require "renderer/glyph/quad"
require "renderer/glyph/quadratic"
require "renderer/glyph/ray"
require "renderer/glyph/rect"
require "renderer/glyph/segment"
require "renderer/glyph/text"
require "renderer/glyph/wedge"

require "renderer/glyph/marker/asterisk"
require "renderer/glyph/marker/circle_cross"
require "renderer/glyph/marker/circle_x"
require "renderer/glyph/marker/cross"
require "renderer/glyph/marker/diamond"
require "renderer/glyph/marker/diamond_cross"
require "renderer/glyph/marker/inverted_triangle"
require "renderer/glyph/marker/square"
require "renderer/glyph/marker/square_cross"
require "renderer/glyph/marker/square_x"
require "renderer/glyph/marker/triangle"
require "renderer/glyph/marker/x"

require "renderer/guide/categorical_axis"
require "renderer/guide/datetime_axis"
require "renderer/guide/grid"
require "renderer/guide/linear_axis"
require "renderer/guide/log_axis"

require "renderer/overlay/box_selection"
require "renderer/overlay/poly_selection"

require "source/column_data_source"
require "source/server_data_source"

require "ticking/abstract_ticker"
require "ticking/adaptive_ticker"
require "ticking/basic_tick_formatter"
require "ticking/basic_ticker"
require "ticking/log_ticker"
require "ticking/log_tick_formatter"
require "ticking/categorical_tick_formatter"
require "ticking/categorical_ticker"
require "ticking/composite_ticker"
require "ticking/datetime_tick_formatter"
require "ticking/datetime_ticker"
require "ticking/days_ticker"
require "ticking/months_ticker"
require "ticking/single_interval_ticker"
require "ticking/years_ticker"

require "tool/button_tool"

require "tool/actions/action_tool"
require "tool/actions/preview_save_tool"
require "tool/actions/reset_tool"

require "tool/gestures/box_select_tool"
require "tool/gestures/box_zoom_tool"
require "tool/gestures/gesture_tool"
require "tool/gestures/lasso_select_tool"
require "tool/gestures/pan_tool"
require "tool/gestures/resize_tool"
require "tool/gestures/select_tool"
require "tool/gestures/tap_tool"
require "tool/gestures/wheel_zoom_tool"

require "tool/inspectors/crosshair_tool"
require "tool/inspectors/hover_tool"
require "tool/inspectors/inspect_tool"

require "widget/data_table"
require "widget/handson_table"
require "widget/table_column"
require "widget/pivot_table"

require "widget/data_table"
require "widget/table_column"
require 'widget/paragraph'
require 'widget/hbox'
require 'widget/vbox'
require 'widget/textinput'
require 'widget/vboxform'
require 'widget/pretext'
require 'widget/selectbox'
require 'widget/slider'
require 'widget/crossfilter'
require 'widget/multiselect'
require 'widget/date_range_slider'
require 'widget/date_picker'
require 'widget/panel'
require 'widget/tabs'
require 'widget/dialog'
require 'widget/icon'
require 'widget/button'
require 'widget/toggle'
require 'widget/dropdown'
require 'widget/checkbox_group'
require 'widget/radio_group'
require 'widget/checkbox_button_group'
require 'widget/radio_button_group'

require 'transforms/autoencode'
require 'transforms/binarysegment'
require 'transforms/const'
require 'transforms/contour'
require 'transforms/count'
require 'transforms/countcategories'
require 'transforms/encode'
require 'transforms/cuberoot'
require 'transforms/hdalpha'
require 'transforms/id'
require 'transforms/interpolate'
require 'transforms/interpolatecolor'
require 'transforms/log'
require 'transforms/nonzero'
require 'transforms/ratio'
require 'transforms/seq'
require 'transforms/spread'
require 'transforms/tocounts'

# add some useful functions to underscore
require("common/custom").monkey_patch()

Config = {}
url = window.location.href
if url.indexOf('/bokeh') > 0
  Config.prefix = url.slice(0, url.indexOf('/bokeh')) + "/" #keep trailing slash
else
  Config.prefix = '/'
console.log('Bokeh: setting prefix to', Config.prefix)

locations =

  Plot:                     'common/plot'
  GMapPlot:                 'common/gmap_plot'
  GeoJSPlot:                'common/geojs_plot'
  GridPlot:                 'common/grid_plot'
  PlotContext:              'common/plot_context'
  PlotList:                 'common/plot_context'
  Canvas:                   'common/canvas'
  LayoutBox:                'common/layout_box'
  CartesianFrame:           'common/cartesian_frame'
  SelectionManager:         'common/selection_manager'
  Selector:                 'common/selector'
  ToolEvents:               'common/tool_events'

  LinearColorMapper:        'mapper/linear_color_mapper'

  DataFactorRange:          'range/data_factor_range'
  DataRange1d:              'range/data_range1d'
  FactorRange:              'range/factor_range'
  Range1d:                  'range/range1d'

  Legend:                   'renderer/annotation/legend'
  Span:                     'renderer/annotation/span'
  Tooltip:                  'renderer/annotation/tooltip'

  GlyphRenderer:            'renderer/glyph/glyph_renderer'

  AnnularWedge:             'renderer/glyph/annular_wedge'
  Annulus:                  'renderer/glyph/annulus'
  Arc:                      'renderer/glyph/arc'
  Bezier:                   'renderer/glyph/bezier'
  Circle:                   'renderer/glyph/circle'
  Gear:                     'renderer/glyph/gear'
  Image:                    'renderer/glyph/image'
  ImageRGBA:                'renderer/glyph/image_rgba'
  ImageURL:                 'renderer/glyph/image_url'
  Line:                     'renderer/glyph/line'
  MultiLine:                'renderer/glyph/multi_line'
  Oval:                     'renderer/glyph/oval'
  Patch:                    'renderer/glyph/patch'
  Patches:                  'renderer/glyph/patches'
  Quad:                     'renderer/glyph/quad'
  Quadratic:                'renderer/glyph/quadratic'
  Ray:                      'renderer/glyph/ray'
  Rect:                     'renderer/glyph/rect'
  Segment:                  'renderer/glyph/segment'
  Text:                     'renderer/glyph/text'
  Wedge:                    'renderer/glyph/wedge'

  Asterisk:                 'renderer/glyph/marker/asterisk'
  CircleCross:              'renderer/glyph/marker/circle_cross'
  CircleX:                  'renderer/glyph/marker/circle_x'
  Cross:                    'renderer/glyph/marker/cross'
  Diamond:                  'renderer/glyph/marker/diamond'
  DiamondCross:             'renderer/glyph/marker/diamond_cross'
  InvertedTriangle:         'renderer/glyph/marker/inverted_triangle'
  Square:                   'renderer/glyph/marker/square'
  SquareCross:              'renderer/glyph/marker/square_cross'
  SquareX:                  'renderer/glyph/marker/square_x'
  Triangle:                 'renderer/glyph/marker/triangle'
  X:                        'renderer/glyph/marker/x'

  LinearAxis:               'renderer/guide/linear_axis'
  LogAxis:                  'renderer/guide/log_axis'
  CategoricalAxis:          'renderer/guide/categorical_axis'
  DatetimeAxis:             'renderer/guide/datetime_axis'
  Grid:                     'renderer/guide/grid'

  BoxSelection:             'renderer/overlay/box_selection'
  PolySelection:            'renderer/overlay/poly_selection'

  ColumnDataSource:         'source/column_data_source'
  ServerDataSource:         'source/server_data_source'

  AbstractTicker:           'ticking/abstract_ticker'
  AdaptiveTicker:           'ticking/adaptive_ticker'
  BasicTicker:              'ticking/basic_ticker'
  BasicTickFormatter:       'ticking/basic_tick_formatter'
  LogTicker:                'ticking/log_ticker'
  LogTickFormatter:         'ticking/log_tick_formatter'
  CategoricalTicker:        'ticking/categorical_ticker'
  CategoricalTickFormatter: 'ticking/categorical_tick_formatter'
  CompositeTicker:          'ticking/composite_ticker'
  DatetimeTicker:           'ticking/datetime_ticker'
  DatetimeTickFormatter:    'ticking/datetime_tick_formatter'
  DaysTicker:               'ticking/days_ticker'
  MonthsTicker:             'ticking/months_ticker'
  SingleIntervalTicker:     'ticking/single_interval_ticker'
  YearsTicker:              'ticking/years_ticker'

  ButtonTool:               'tool/button_tool'
  ActionTool:               'tool/actions/action_tool'
  PreviewSaveTool:          'tool/actions/preview_save_tool'
  ResetTool:                'tool/actions/reset_tool'

  BoxSelectTool:            'tool/gestures/box_select_tool'
  BoxZoomTool:              'tool/gestures/box_zoom_tool'
  GestureTool:              'tool/gestures/gesture_tool'
  LassoSelectTool:          'tool/gestures/lasso_select_tool'
  PanTool:                  'tool/gestures/pan_tool'
  PolySelectTool:           'tool/gestures/poly_select_tool'
  SelectTool:               'tool/gestures/select_tool'
  ResizeTool:               'tool/gestures/resize_tool'
  TapTool:                  'tool/gestures/tap_tool'
  WheelZoomTool:            'tool/gestures/wheel_zoom_tool'

  CrosshairTool:            'tool/inspectors/crosshair_tool'
  HoverTool:                'tool/inspectors/hover_tool'
  InspectTool:              'tool/inspectors/inspect_tool'

  DataTable:                'widget/data_table'
  HandsonTable:             'widget/handson_table'
  TableColumn:              'widget/table_column'
  PivotTable:               'widget/pivot_table'

  DataTable:                "widget/data_table"
  TableColumn:              "widget/table_column"
  Paragraph:                'widget/paragraph'
  HBox:                     'widget/hbox'
  VBox:                     'widget/vbox'
  VBoxForm:                 'widget/vboxform'
  TextInput:                'widget/textinput'
  PreText:                  'widget/pretext'
  Select:                   'widget/selectbox'
  Slider:                   'widget/slider'
  CrossFilter:              'widget/crossfilter'
  MultiSelect:              'widget/multiselect'
  DateRangeSlider:          'widget/date_range_slider'
  DatePicker:               'widget/date_picker'
  Panel:                    'widget/panel'
  Tabs:                     'widget/tabs'
  Dialog:                   'widget/dialog'
  Icon:                     'widget/icon'
  Button:                   'widget/button'
  Toggle:                   'widget/toggle'
  Dropdown:                 'widget/dropdown'
  CheckboxGroup:            'widget/checkbox_group'
  RadioGroup:               'widget/radio_group'
  CheckboxButtonGroup:      'widget/checkbox_button_group'
  RadioButtonGroup:         'widget/radio_button_group'

  AutoEncode:               'transforms/autoencode'
  BinarySegment:            'transforms/binarysegment'
  Const:                    'transforms/const'
  Contour:                  'transforms/contour'
  Count:                    'transforms/count'
  CountCategories:          'transforms/countcategories'
  Cuberoot:                 'transforms/cuberoot'
  HDAlpha:                  'transforms/hdalpha'
  Encode:                   'transforms/encode'
  Id:                       'transforms/id'
  Interpolate:              'transforms/interpolate'
  InterpolateColor:         'transforms/interpolatecolor'
  Log:                      'transforms/log'
  NonZero:                  'transforms/nonzero'
  Ratio:                    'transforms/ratio'
  Seq:                      'transforms/seq'
  Spread:                   'transforms/spread'
  ToCounts:                 'transforms/tocounts'

mod_cache = {}
collection_overrides = {}

Collections = (typename) ->
 if collection_overrides[typename]
   return collection_overrides[typename]

  if not locations[typename]
    throw "./base: Unknown Collection #{typename}"

  modulename = locations[typename]

  if not mod_cache[modulename]?
    mod = require(modulename)

    if mod?
        mod_cache[modulename] = mod
    else
        throw Error("improperly implemented collection: #{modulename}")

  return mod_cache[modulename].Collection

Collections.register = (name, collection) ->
  collection_overrides[name] = collection

index = {}

module.exports =
  collection_overrides: collection_overrides # for testing only
  mod_cache: mod_cache # for testing only
  locations: locations
  index: index
  Collections: Collections
  Config: Config
