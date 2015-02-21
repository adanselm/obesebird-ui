'use strict'

_categories = [
  {
    id: '1'
    name: 'Company Life'
  }
  {
    id: '2'
    name: 'Music'
  }
  {
    id: '3'
    name: 'Misc'
  }
]

module.exports =
  name: 'categories'

  read: (req, resource, params, config, callback) ->
    callback null, _categories

  create: (req, resource, params, body, config, callback) ->
    _categories.push
      id: params.id
      name: params.name
    callback null, _categories
