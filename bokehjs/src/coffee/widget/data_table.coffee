_ = require "underscore"
$ = require "jquery"
ContinuumView = require "common/continuum_view"
HasProperties = require "common/has_properties"
Collection = require "common/collection"
SlickGrid = require "slickgrid/slick.grid"
RowSelectionModel = require "slickgrid/plugins/slick.rowselectionmodel"
$1 = require "jquery-ui/sortable"

class DataProvider

  constructor: (@source) ->
    @data = @source.get('data')
    @fields = _.keys(@data)

  getLength: () -> @source.get_length()

  getItem: (index) ->
    item = {}
    for field in @fields
      item[field] = @data[field][index]
    return item

  getItemMetadata: (index) -> null

class DataTableView extends ContinuumView

  initialize: (options) ->
    super(options)
    @render()
    @listenTo(@model, 'change', () => @render())
    source = @mget("source")
    @listenTo(source, 'change:data', () => @updateGrid())
    @listenTo(source, 'change:selected', () => @updateSelection())

  updateGrid: () ->
    @data = new DataProvider(@mget("source"))
    @grid.setData(@data)
    @grid.render()

  updateSelection: () ->
    selected = @mget("source").get("selected")
    @grid.setSelectedRows(selected)

  render: () ->
    columns = for column in @mget("columns")
      id: _.uniqueId()
      field: column.get("field")
      name: column.get("title")
      width: column.get("width") or 300

    options =
      enableCellNavigation: true
      enableColumnReorder: true
      forceFitColumns: true

    @$el.css(width: "#{@mget("width")}px", height: "#{@mget("height")}px")

    @data = new DataProvider(@mget("source"))
    @grid = new SlickGrid(@el, @data, columns, options)
    @grid.setSelectionModel(new RowSelectionModel())

    @grid.onSelectedRowsChanged.subscribe (event, args) =>
      @mget("source").set("selected", args.rows)

class DataTable extends HasProperties
  type: 'DataTable'
  default_view: DataTableView

  defaults: ->
    return _.extend {}, super(), {}

class DataTables extends Collection
  model: DataTable

module.exports =
  Model: DataTable
  Collection: new DataTables()
  View: DataTableView
