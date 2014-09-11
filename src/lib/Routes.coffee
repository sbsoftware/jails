defaultRoutes =
  new: (app, name, controller_class_name) ->
    app.get "/#{name}/new", (req, res, next) ->
      controller = new Jails[controller_class_name](req, res, next)
      controller.invokeMethod('new')

class Routes
  constructor: (@routeDef) ->

  applyTo: (app) ->
    @app = app
    @routeDef.apply(this)

  resources: (name, config = {}) ->
    Object.keys(defaultRoutes).forEach (route) =>
      return if config.except?.indexOf(route) > -1
      return if config.only?.indexOf(route) == -1
      controller_class_name = "#{name.constantize().singularize()}Controller"
      defaultRoutes[route](@app, name, controller_class_name)

  get: () ->
    @app.get.apply @app, arguments

module.exports = Routes
