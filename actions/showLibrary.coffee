debug = require('debug')('showLibraryAction')
loadPosts = require './loadPosts'
loadCategories = require './loadCategories'
CategoryStore = require '../stores/CategoryStore'

module.exports = (context, payload, done) ->
  debug 'showLibrary action'

  if !payload.categoryID
    debug 'opening first category'
    catStore = context.getStore CategoryStore
    payload.categoryID = catStore.getAll()[0].id

  context.dispatch 'OPEN_CATEGORY', payload

  context.executeAction loadCategories, payload, ->
    context.executeAction loadPosts, payload, ->
      done()
