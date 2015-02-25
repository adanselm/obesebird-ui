'use strict'
debug = require('debug')('postComposerView')
React = require 'react'
createPost = require '../actions/createPost'
CategoryStore = require '../stores/CategoryStore'
FluxibleMixin = require('fluxible').Mixin

{h1, label, div, textarea, select, option, button} = React.DOM

PostComposer = React.createClass

  mixins: [FluxibleMixin]

  statics:
    storeListeners: [CategoryStore]

  getInitialState: ->
    @getState()

  getState: ->
    categoryStore = @getStore CategoryStore
    {
      text: ''
      categoryID: categoryStore.getCurrentID()
      categories: categoryStore.getAll()
    }

  onChange: ->
    @setState @getState()

  render: ->
    div null,
      h1 null, "New Post"
      div
        className: "ui form"
        div
          className: "field"
          label null, "Category"
          select
            className: "category-selector"
            name: "category"
            onChange: @_onCategoryChange
            for category in @state.categories
              option
                value: category.id
                key: category.id
                label: category.name
                category.name
        div
          className: "field"
          label null, "Message"
          textarea
            className: "post-composer"
            name: "post"
            onChange: @_onTextChange
        button
          className: "ui primary button"
          type: "button"
          onClick: @_onButtonClick
          "Save"

  _onTextChange: (event, value) ->
    @state.text = event.target.value

  _onCategoryChange: (event, value) ->
    @state.categoryID = event.target.value

  _onButtonClick: (event) ->
    text = @state.text.trim()
    if (text)
      @executeAction createPost,
        { text: text, categoryID: @state.categoryID }
    @state.text = ''

module.exports = PostComposer
