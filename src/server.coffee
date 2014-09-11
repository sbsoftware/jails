#!/usr/bin/env coffee

express = require('express')
http = require('http')
require('./environment')

class Server
  constructor: () ->
    @app = express()

  start: (cb) ->
    routeDef = require("#{process.cwd()}/config/routes")
    routes = new Jails.Routes(routeDef)
    routes.applyTo @app

    http.createServer(@app).listen(3001, cb)

module.exports = Server

server = new Server()
server.start()
