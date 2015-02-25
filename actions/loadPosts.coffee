PostsStore = require '../stores/PostsStore'
debug = require('debug')('loadPostsAction')

fetchPosts = (context, payload, done) ->
  debug 'fetching posts'
  context.service.read 'posts', {}, {}, (err, messages) ->
    if err
      context.dispatch 'RECEIVE_POSTS_FAILURE', messages
    else
      context.dispatch 'RECEIVE_POSTS', messages
    done()

module.exports = (context, payload, done) ->
  debug 'loadPosts action'
  postsStore = context.getStore PostsStore
  if Object.keys(postsStore.getAll()).length == 0
    fetchPosts(context, payload, done)
  else
    done()


