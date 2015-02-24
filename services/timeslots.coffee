'use strict'

_timeslots = [
  {
    id: '1'
    categoryID: '1'
    dayOfWeek: '1'
    hour: '13'
    min: '00'
  }
  {
    id: '2'
    categoryID: '2'
    dayOfWeek: '3'
    hour: '16'
    min: '00'
  }
  {
    id: '3'
    categoryID: '3'
    dayOfWeek: '5'
    hour: '08'
    min: '30'
  }
  {
    id: '4'
    categoryID: '3'
    dayOfWeek: '1'
    hour: '08'
    min: '30'
  }
]

_genId = ->
  nextId = 1 + parseInt _timeslots[_timeslots.length - 1].id
  nextId.toString()

module.exports =
  name: 'timeslots'

  read: (req, resource, params, config, callback) ->
    callback null, _timeslots

  create: (req, resource, params, body, config, callback) ->
    _timeslots.push
      id: _genId()
      categoryID: params.categoryID
      dayOfWeek: params.dayOfWeek # 0-6 (0 = sunday)
      hour: params.hour # (0-23)
      min: params.min # (0-59)
    callback null, _timeslots
