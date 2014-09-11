fs = require 'fs'
path = require 'path'

global['Jails'] = {}
["#{__dirname}/lib", "#{process.cwd()}/app/controllers", "#{process.cwd()}/app/models"].forEach (dirpath) ->
  if fs.existsSync(dirpath)
    fs.readdirSync(dirpath).forEach (file) ->
      full_path = "#{dirpath}/#{file}"
      extname = path.extname full_path
      if extname in ['.coffee', '.js']
        Jails[path.basename(full_path, extname)] = require("#{dirpath}/#{file}")

unless String.prototype.constantize
  String.prototype.constantize = () ->
    @replace(/(\ |^)([a-zA-Z])/, (l) -> l.toUpperCase())

unless String.prototype.singularize
  String.prototype.singularize = () ->
    @slice 0, -1
