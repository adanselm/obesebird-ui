'use strict'
debug = require('debug')('Example:createPostAction')
PostsStore = require '../stores/PostsStore'

module.exports = (context, payload, done) ->

  postsStore = context.getStore PostsStore

  post = postsStore.createMessage
    text: payload.text
    categoryID: payload.categoryID

  context.service.create 'posts', post, {}, (err, posts) ->
    if err
      context.dispatch 'RECEIVE_POSTS_FAILURE', [ post ]
    else
      context.dispatch 'RECEIVE_POSTS', [ posts[posts.length - 1] ]
    done()
