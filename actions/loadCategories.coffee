CategoriesStore = require '../stores/CategoryStore'
debug = require('debug')('loadCategoriesAction')

fetchCategories = (context, payload, done) ->
  debug 'fetching categories'
  context.service.read 'categories', {}, {}, (err, cats) ->
    context.dispatch 'RECEIVE_CATEGORIES', cats
    done()

module.exports = (context, payload, done) ->
  debug 'loadCategories action'
  categoriesStore = context.getStore CategoriesStore
  if Object.keys(categoriesStore.getAll()).length == 0
    fetchCategories(context, payload, done)
  else
    done()


