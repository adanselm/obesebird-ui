'use strict'
debug = require('debug')('Example:createTimeslotAction')

module.exports = (context, payload, done) ->

  slot =
    categoryID: payload.categoryID
    dayOfWeek: payload.dayOfWeek
    hour: payload.hour
    min: payload.min

  context.service.create 'timeslots', slot, {}, (err, slots) ->
    if err
      context.dispatch 'RECEIVE_SCHEDULE_FAILURE', [ slot ]
      done()
      return
    context.dispatch 'RECEIVE_SCHEDULE', [ slots[slots.length - 1] ]
    done()
