class JailModel
  @db_connector = new Jails.FileSystemDBConnector()

  @find: (id, cb) ->
    @db_connector.establish_connection()
    @db_connector.find "posts", id, (err, attributes) =>
      cb(err, new @(attributes))

  constructor: (@attributes) ->
    @initialize?.call @

  has_many: (name, opts) ->
    Object.defineProperty(@, name,
      get: () ->
        []
    )

module.exports = JailModel
