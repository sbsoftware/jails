fs = require 'fs'

class FileSystemDBConnector
  establish_connection: () ->
    @db = JSON.parse(fs.readFileSync("#{process.cwd()}/db.json"))

  find: (resourceName, id, cb) ->
    @db[resourceName].forEach (resource) ->
      cb(null, resource) if resource.id == id

module.exports = FileSystemDBConnector
