'use strict'
debug = require('debug')('postsLibraryView')
React = require 'react'
Categories = require './CategoriesList'
Posts = require './Posts'

{h1, div} = React.DOM

module.exports = React.createClass

  render: ->
    debug 'rendering Library'
    div null,
      h1 null, "Library"
      React.createElement Categories
      React.createElement Posts

