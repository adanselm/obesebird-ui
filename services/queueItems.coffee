'use strict'

_queueItems = [
  {
    id: '1'
    postID: '1'
    publicationTime: Date.now() - 89999
  }
  {
    id: '2'
    postID: '2'
    publicationTime: Date.now() - 79999
  }
  {
    id: '3'
    postID: '3'
    publicationTime: Date.now() - 69999
  }
]

module.exports =
  name: 'queueItems'

  read: (req, resource, params, config, callback) ->
    callback null, _queueItems

  create: (req, resource, params, body, config, callback) ->
    _queueItems.push
      id: params.id
      postID: params.postID
      publicationTime: params.publicationTime
    callback null, _queueItems
