'use strict'
debug = require('debug')('postsView')
React = require 'react'
PostsStore = require '../stores/PostsStore'
FluxibleMixin = require('fluxible').Mixin

{ul, li, a, div} = React.DOM

module.exports = React.createClass
  mixins: [FluxibleMixin]

  statics:
    storeListeners: [PostsStore]

  getInitialState: ->
    @getState()

  getState: ->
    msgStore = @getStore PostsStore
    {
      posts: msgStore.getAllForCurrentCategory()
    }

  onChange: ->
    debug 'posts change'
    @setState @getState()

  render: ->
    debug 'rendering Posts'
    div null,
      ul
        className: "ui big divided list"
        for post in @state.posts
          li
            className: "item"
            key: post.id
            a
              href: "/posts/#{post.id}"
              post.text

