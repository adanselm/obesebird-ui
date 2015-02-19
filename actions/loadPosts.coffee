PostsStore = require '../stores/PostsStore'
debug = require('debug')('loadPostsAction')

fetchPosts = (context, payload, done) ->
  debug 'fetching posts'
  context.service.read 'posts', {}, {}, (err, messages) ->
    context.dispatch 'RECEIVE_POSTS', messages
    context.dispatch 'UPDATE_PAGE_TITLE', pageTitle: payload.config.title
    done()

module.exports = (context, payload, done) ->
  debug 'loadPosts action'
  postsStore = context.getStore PostsStore
  if Object.keys(postsStore.getAll()).length == 0
    fetchPosts(context, payload, done)
  else
    context.dispatch 'UPDATE_PAGE_TITLE', pageTitle: payload.config.title
    done()


