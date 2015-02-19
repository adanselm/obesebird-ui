'use strict'
debug = require('debug')('postsView')
React = require 'react'
PostsStore = require '../stores/PostsStore'
FluxibleMixin = require('fluxible').Mixin

{h1, ul, li, a, div} = React.DOM

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
    @setState @getState()

  render: ->
    debug 'rendering Posts'
    div null,
      h1 null, "Posts"
      ul null,
        for post in @state.posts
          li
            key: post.id
            a
              href: "/posts/#{post.id}"
              post.text

