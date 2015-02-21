'use strict'

loadPage = require '../actions/loadPage'
showLibrary = require '../actions/showLibrary'

module.exports =
  home:
    path: '/'
    url: '/'
    method: 'get'
    page: 'home'
    title: 'Home'
    action: loadPage

  about:
    path: '/about'
    url: '/about'
    method: 'get'
    page: 'about'
    title: 'About'
    action: loadPage

  library:
    path: '/library/:id'
    url: '/library/1'
    method: 'get'
    page: 'library'
    title: 'Library'
    action: (context, payload, done) ->
      payload.categoryID = payload.params.id
      context.executeAction showLibrary, payload, ->
        done()
