'use strict'

###*
# This leverages Express to create and run the http server.
# A fluxible context is created and executes the navigateAction
# based on the URL. Once completed, the store state is dehydrated
# and the application is rendered via React.
###
require('node-jsx').install extension: '.jsx'

express = require('express')
serialize = require('serialize-javascript')
navigateAction = require('flux-router-component').navigateAction
debug = require('debug')('delaio-ui')
React = require('react')
app = require('./app')

htmlComponent = React.createFactory(require('./components/Html.jsx'))

server = express()
server.set 'state namespace', 'App'

server.use '/public', express.static(__dirname + '/build')
server.use (req, res, next) ->
  context = app.createContext()

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
