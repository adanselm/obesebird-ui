'use strict'

React = require('react')
Fluxible = require('fluxible')
routrPlugin = require('fluxible-plugin-routr')

# create new fluxible instance
appjsx = require('./components/Application.jsx')
app = new Fluxible(appComponent: React.createFactory(appjsx))

# add routes to the routr plugin
app.plug routrPlugin(routes: require('./configs/routes'))

# register stores
app.registerStore require('./stores/ApplicationStore')

module.exports = app
