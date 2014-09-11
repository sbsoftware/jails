class JailController
  constructor: (@req, @res, @next) ->
    @initialize?.call(this)

  before_filter: (filter) ->
    @before_filters ||= []
    @before_filters.push(filter)

  after_filter: (filter) ->
    @after_filters ||= []
    @after_filters.push(filter)

  invokeMethod: (method) ->
    @before_filters?.forEach (filter) ->
      filter.apply this
    this[method].apply this
    @after_filters?.forEach (filter) ->
      filter.apply this

  new: () ->

  create: () ->

  edit: () ->

  update: () ->

  destroy: () ->

module.exports = JailController
