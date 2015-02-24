'use strict'

debug = require('debug')('ScheduleStore')
createStore = require 'fluxible/utils/createStore'

module.exports = createStore
  storeName: 'ScheduleStore'

  handlers:
    'RECEIVE_SCHEDULE': 'receiveTimeslots'

  initialize: (dispatcher) ->
    @byTime = {}

  getAllByTime: ->
    @byTime

  isEmpty: ->
    if @byTime? and Object.keys(@byTime).length > 0
      false
    else
      true

  getDaysOfWeek: ->
    [
      'Sunday', 'Monday', 'Tuesday', 'Wednesday',
      'Thursday', 'Friday', 'Saturday'
    ]

  receiveTimeslots: (slots) ->
    debug 'ScheduleStore receiveTimeslots'
    for s in slots
      t = @toTotalMin s.hour, s.min
      @push @byTime, t, s
    @emitChange()

  ## Add val to the list at obj.key
  push: (obj, key, val) ->
    if obj[key]?
      obj[key].push val
    else
      obj[key] = [ val ]

  toTotalMin: (hours, minutes) ->
    parseInt(hours) * 60 + parseInt(minutes)

  createTimeslot: (details) ->
    categoryID: details.categoryID
    dayOfWeek: details.dayOfWeek

  dehydrate: ->
    {
      byTime: @byTime
    }

  rehydrate: (state) ->
    @byTime = state.byTime
