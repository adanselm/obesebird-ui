'use strict'

###*
# This leverages Express to create and run the http server.
# A fluxible context is created and executes the navigateAction
# based on the URL. Once completed, the store state is dehydrated
# and the application is rendered via React.
###
require('node-jsx').install extension: '.jsx'

express = require 'express'
favicon = require 'serve-favicon'
bodyParser = require 'body-parser'
cookieParser = require 'cookie-parser'
csrf = require 'csurf'
serialize = require 'serialize-javascript'
navigateAction = require('flux-router-component').navigateAction
debug = require('debug')('delaio-ui')
React = require 'react'
app = require './app'

htmlComponent = React.createFactory(require('./components/Html.jsx'))

server = express()
server.use favicon(__dirname + '/favicon.ico')
server.set 'state namespace', 'App'
server.use '/public', express.static(__dirname + '/build')
server.use cookieParser()
server.use bodyParser.json()
server.use csrf({cookie: true})

# Get access to the fetchr plugin instance
fetchrPlugin = app.getPlugin 'FetchrPlugin'
# Register our messages REST service
fetchrPlugin.registerService require('./services/posts')
fetchrPlugin.registerService require('./services/categories')
fetchrPlugin.registerService require('./services/timeslots')
fetchrPlugin.registerService require('./services/queueItems')

# Set up the fetchr middleware
server.use fetchrPlugin.getXhrPath(), fetchrPlugin.getMiddleware()
server.use '/public', express.static(__dirname + '/build')
server.use (req, res, next) ->
  context = app.createContext
    req: req # The fetchr plugin depends on this
    xhrContext:
      _csrf: req.csrfToken() # Make sure all XHR requests have the CSRF token

  debug 'Executing navigate action'
  requrl = { url: req.url }
  context.getActionContext().executeAction navigateAction, requrl, (err) ->
    if err
      if err.status and err.status == 404
        next()
      else
        next err

    debug 'Exposing context state'
    exposed = 'window.App=' + serialize(app.dehydrate(context)) + ';'

    debug 'Rendering Application component into html'
    appComponent = app.getAppComponent()
    React.withContext context.getComponentContext(), ->
      html = React.renderToStaticMarkup(htmlComponent(
        state: exposed
        markup: React.renderToString(appComponent())))

      debug 'Sending markup'
      res.write '<!DOCTYPE html>' + html
      res.end()

port = process.env.PORT or 3000
server.listen port
console.log 'Listening on port ' + port
