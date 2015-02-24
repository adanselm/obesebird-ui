'use strict'

React = require 'react'
Fluxible = require 'fluxible'
routrPlugin = require 'fluxible-plugin-routr'
fetchrPlugin = require 'fluxible-plugin-fetchr'

# create new fluxible instance
appjsx = require './components/Application.jsx'
app = new Fluxible(appComponent: React.createFactory(appjsx))

# add routes to the routr plugin
app.plug routrPlugin(routes: require('./configs/routes'))
app.plug fetchrPlugin(xhrPath: '/api')

# register stores
app.registerStore require('./stores/ApplicationStore')
app.registerStore require('./stores/CategoryStore')
app.registerStore require('./stores/PostsStore')
app.registerStore require('./stores/ScheduleStore')

module.exports = app
