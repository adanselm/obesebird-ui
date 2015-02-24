'use strict'

debug = require('debug')('CategoriesStore')
createStore = require 'fluxible/utils/createStore'

module.exports = createStore
  storeName: 'CategoryStore'

  handlers:
    'RECEIVE_CATEGORIES': 'receiveCategories'
    'OPEN_CATEGORY': 'openCategory'

  initialize: (dispatcher) ->
    @currentID = null
    @categories = {}

  get: (id) ->
    @categories[id]

  getAll: ->
    cats = []
    for key in Object.keys(@categories)
      cats.push @categories[key]
    cats

  getById: ->
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

  getCurrentCategoryName: ->
    @categories[@currentID].name

  getCurrent: ->
    @get @getCurrentID()

  openCategory: (payload) ->
    @currentID = payload.categoryID
    @emitChange()

  receiveCategories: (categories) ->
    debug 'CategoriesStore receiveCategories'
    for cat in categories
      @categories[cat.id] = cat
    @emitChange()

  dehydrate: ->
    {
      currentID: @currentID
      categories: @categories
    }

  rehydrate: (state) ->
    @currentID = state.currentID
    @categories = state.categories
