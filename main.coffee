url       = require 'url'
_         = require 'lodash'
Promise   = require 'bluebird'
path      = require 'path'
Electron  = require 'electron'

class BestApp
  _initHandlers: ->
    @app.on 'ready', =>
      @window = new Electron.BrowserWindow width: 200, height: 200
      @loadPage 'index.html'

  constructor: ->
    {@app} = Electron
    @_initHandlers()

  loadPage: (u) ->
    u = u.replace /^[a-z]+\:/, ''
    unless is_remote = /^\/\//.test u
      u = "#{global.app_root}/#{u}"
     @window.loadURL url.format
       pathname:  u
       protocol:  if is_remote then 'http:' else 'file:'
       slashes:    true

module.exports = new BestApp()
