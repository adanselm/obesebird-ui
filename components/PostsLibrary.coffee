'use strict'
debug = require('debug')('postsLibraryView')
React = require 'react'
Categories = require './CategoriesList'
Posts = require './Posts'
FluxibleMixin = require('fluxible').Mixin

{h1, div} = React.DOM

module.exports = React.createClass
  mixins: [FluxibleMixin]

  getInitialState: ->
    @getState()

  getState: ->
    { }

  onChange: ->
    @setState @getState()

  render: ->
    debug 'rendering Library'
    div null,
      h1 null, "Library"
      React.createElement Categories
      React.createElement Posts

