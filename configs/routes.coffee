'use strict'

loadPage = require '../actions/loadPage'
loadPosts = require '../actions/loadPosts'

module.exports =
  home:
    path: '/'
    method: 'get'
    page: 'home'
    title: 'Home'
    action: loadPage

  about:
    path: '/about'
    method: 'get'
    page: 'about'
    title: 'About'
    action: loadPage

  posts:
    path: '/posts'
    method: 'get'
    page: 'posts'
    title: 'Posts'
    action: loadPosts
