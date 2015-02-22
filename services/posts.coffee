'use strict'

_posts = [
  {
    id: '1'
    categoryID: '1'
    text: 'Checkout out our latest product FooBarBaz #awesome'
    creationDate: Date.now() - 99999
    lastSubmissionDate: null
    isQueued: false
  }
  {
    id: '2'
    categoryID: '1'
    text: 'Company Hackathon will take place next week http://check.this.url'
    creationDate: Date.now() - 89999
    lastSubmissionDate: null
    isQueued: false
  }
  {
    id: '3'
    categoryID: '1'
    text: 'Releasing project XYZ as open source. Yay.'
    creationDate: Date.now() - 79999
    lastSubmissionDate: null
    isQueued: false
  }
  {
    id: '4'
    categoryID: '2'
    text: 'Who\'s in for the next One Direction concert?'
    creationDate: Date.now() - 69999
    lastSubmissionDate: null
    isQueued: false
  }
  {
    id: '5'
    categoryID: '2'
    text: 'The 5 best metal bands names of all time. http://this.url.too'
    creationDate: Date.now() - 59999
    lastSubmissionDate: null
    isQueued: false
  }
  {
    id: '6'
    categoryID: '3'
    text: 'I like pancakes. Do you?'
    creationDate: Date.now() - 49999
    lastSubmissionDate: null
    isQueued: false
  }
  {
    id: '7'
    categoryID: '3'
    text: 'I am the walrus.'
    creationDate: Date.now() - 39999
    lastSubmissionDate: null
    isQueued: false
  }
]

_genId = ->
  nextId = 1 + parseInt _posts[_posts.length - 1].id
  nextId.toString()

module.exports =
  name: 'posts'

  read: (req, resource, params, config, callback) ->
    callback null, _posts

  create: (req, resource, params, body, config, callback) ->
    _posts.push
      id: _genId()
      categoryID: params.categoryID
      text: params.text
      creationDate: params.creationDate
      lastSubmissionDate: params.lastSubmissionDate
      isQueued: params.isQueued
    callback null, _posts
