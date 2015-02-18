###global document, window ###
'use strict'

React = require('react')
debug = require('debug')
debugClient = debug('delaio-ui')
app = require('./app')

dehydratedState = window.App

# Sent from the server
window.React = React

# For chrome dev tool support: expose debug object to browser,
# so that it can be enabled/disabled from browser:
# https://github.com/visionmedia/debug#browser-support
window.fluxibleDebug = debug

debugClient 'rehydrating app'

# pass in the dehydrated server state from server.js
app.rehydrate dehydratedState, (err, context) ->
  if err
    throw err
  window.context = context
  mountNode = document.getElementById('app')

  debugClient 'React Rendering'
  React.withContext context.getComponentContext(), ->
    React.render context.createElement(), mountNode, ->
      debugClient 'React Rendered'
