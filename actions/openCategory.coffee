debug = require('debug')('showLibraryAction')
CategoryStore = require '../stores/CategoryStore'

module.exports = (context, payload, done) ->
  debug 'showLibrary action'

  if !payload.categoryID
    debug 'opening first category'
    catStore = context.getStore CategoryStore
    payload.categoryID = catStore.getAll()[0].id

  context.dispatch 'OPEN_CATEGORY', payload

  done()
