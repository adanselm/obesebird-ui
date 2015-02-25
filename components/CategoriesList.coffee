'use strict'
debug = require('debug')('categoriesListView')
React = require 'react'
CategoryStore = require '../stores/CategoryStore'
FluxibleMixin = require('fluxible').Mixin

{ul, li, a, div} = React.DOM

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
      ul
        className: "ui large vertical menu"
        div
          className: "header item"
          "Categories"
        for category in @state.categories
          if category.id == @state.currentCategoryID
            selected = "active"
          else
            selected = ""
          li
            className: "item #{selected}"
            key: category.id
            a
              href: "/library/#{category.id}"
              category.name

