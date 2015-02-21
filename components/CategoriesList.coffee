'use strict'
debug = require('debug')('categoriesListView')
React = require 'react'
CategoryStore = require '../stores/CategoryStore'
FluxibleMixin = require('fluxible').Mixin

{h2, ul, li, a, div} = React.DOM

module.exports = React.createClass
  mixins: [FluxibleMixin]

  statics:
    storeListeners: [CategoryStore]

  getInitialState: ->
    @getState()

  getState: ->
    catStore = @getStore CategoryStore
    {
      categories: catStore.getAll()
      currentCategoryID: catStore.getCurrentID()
    }

  onChange: ->
    @setState @getState()

  render: ->
    debug 'rendering categories'
    div null,
      h2 null, "Categories"
      ul null,
        for category in @state.categories
          li
            key: category.id
            a
              href: "/library/#{category.id}"
              category.name

