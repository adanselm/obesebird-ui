'use strict'

debug = require('debug')('PostsStore')
createStore = require 'fluxible/utils/createStore'
CategoryStore = require './CategoryStore'

module.exports = createStore
  storeName: 'PostsStore'

  handlers:
    'RECEIVE_POSTS': 'receiveMessages'

  initialize: (dispatcher) ->
    debug 'Initializing PostsStore'
    @messages = {}
    @sortedByDate = []

  receiveMessages: (messages) ->
    debug 'PostsStore receiveMessages'
    for message in messages
      @messages[message.id] = message

    @sortedByDate = Object.keys @messages
    self = this
    @sortedByDate.sort (a, b) ->
      -1 if self.messages[a].date < self.messages[b].date
      1 if self.messages[a].date > self.messages[b].date
      0
    @emitChange()

  getAll: ->
    debug 'getAll ' + @messages.length
    @messages

  get: (id) ->
    @messages[id]

  getAllForCategory: (categoryID) ->
    debug 'PostsStore getAllForThread'
    threadMessages = []
    for key in @sortedByDate
      message = @messages[key]
      if message.categoryID == categoryID
        threadMessages.push message
    threadMessages

  getAllForCurrentCategory: ->
    currentCategoryID = @dispatcher.getStore(CategoryStore).getCurrentID()
    @getAllForCategory currentCategoryID

  dehydrate: ->
    messages: @messages
    sortedByDate: @sortedByDate

  rehydrate: (state) ->
    @messages = state.messages
    @sortedByDate = state.sortedByDate

