'use strict'

createStore = require 'fluxible/utils/createStore'

module.exports = createStore
  storeName: 'CategoryStore'

  handlers:
    'RECEIVE_POSTS': 'receiveMessages'

  initialize: (dispatcher) ->
    @currentID = null
    @categories = {}

  get: (id) ->
    @categories[id]

  getAll: ->
    @categories

  getCurrentID: ->
    if @currentID
      @currentID
    else
      keys = Object.keys @categories
      if keys.length > 0
        @categories[keys[0]].id
      else
        '1'

  getCurrentThreadName: ->
    @categories[@currentID].name

  getCurrent: ->
    @get @getCurrentID()

  receiveMessages: (messages) ->
    self = this
    @dispatcher.waitFor 'PostsStore', ->
      for message in messages
        categoryID = message.categoryID
        category = self.categories[categoryID]
        if category and category.lastTimestamp > message.creationDate
          return
        self.categories[categoryID] =
          id: categoryID
          name: message.categoryName
          lastMessage: message

      self.emitChange()

  dehydrate: ->
    {
      currentID: @currentID
      categories: @categories
    }

  rehydrate: (state) ->
    @currentID = state.currentID
    @categories = state.categories
