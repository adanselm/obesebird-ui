'use strict'

_posts = [
  {
    id: '1'
    categoryID: '1'
    authorName: 'Bill'
    text: 'Checkout out our latest product FooBarBaz #awesome'
    creationDate: Date.now() - 99999
    lastSubmissionDate: null
    isQueued: false
  }
  {
    id: '2'
    categoryID: '1'
    authorName: 'Bill'
    text: 'Company Hackathon will take place next week http://check.this.url'
    creationDate: Date.now() - 89999
    lastSubmissionDate: null
    isQueued: false
  }
  {
    id: '3'
    categoryID: '1'
    authorName: 'Jing'
    text: 'Releasing project XYZ as open source. Yay.'
    creationDate: Date.now() - 79999
    lastSubmissionDate: null
    isQueued: false
  }
  {
    id: '4'
    categoryID: '2'
    authorName: 'Bill'
    text: 'Who\'s in for the next One Direction concert?'
    creationDate: Date.now() - 69999
    lastSubmissionDate: null
    isQueued: false
  }
  {
    id: '5'
    categoryID: '2'
    authorName: 'Dave'
    text: 'The 5 best metal bands names of all time. http://this.url.too'
    creationDate: Date.now() - 59999
    lastSubmissionDate: null
    isQueued: false
  }
  {
    id: '6'
    categoryID: '3'
    authorName: 'Bill'
    text: 'I like pancakes. Do you?'
    creationDate: Date.now() - 49999
    lastSubmissionDate: null
    isQueued: false
  }
  {
    id: '7'
    categoryID: '3'
    authorName: 'John'
    text: 'I am the walrus.'
    creationDate: Date.now() - 39999
    lastSubmissionDate: null
    isQueued: false
  }
]

module.exports =
  name: 'posts'

  read: (req, resource, params, config, callback) ->
    callback null, _posts

  create: (req, resource, params, body, config, callback) ->
    _posts.push
      id: params.id
      categoryID: params.categoryID
      authorName: params.authorName
      text: params.text
      creationDate: params.creationDate
      lastSubmissionDate: params.lastSubmissionDate
      isQueued: params.isQueued
    callback null, _posts
