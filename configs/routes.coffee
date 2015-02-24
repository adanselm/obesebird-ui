'use strict'

loadPage = require '../actions/loadPage'
loadCategories = require '../actions/loadCategories'
loadSchedule = require '../actions/loadSchedule'
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

  newpost:
    path: '/posts/new'
    url: '/posts/new'
    method: 'get'
    page: 'newpost'
    title: 'New Post'
    action: (context, payload, done) ->
      context.executeAction loadCategories, payload, ->
        context.executeAction loadPage, payload, ->
          done()

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

  schedule:
    path: '/schedule'
    url: '/schedule'
    method: 'get'
    page: 'schedule'
    title: 'Schedule'
    action: (context, payload, done) ->
      context.executeAction loadCategories, payload, ->
        context.executeAction loadSchedule, payload, ->
          context.executeAction loadPage, payload, ->
            done()
