debug = require('debug')('loadScheduleAction')
ScheduleStore = require '../stores/ScheduleStore'

fetchSchedule = (context, payload, done) ->
  debug 'fetching schedule'
  context.service.read 'timeslots', {}, {}, (err, slots) ->
    if err
      context.dispatch 'RECEIVE_SCHEDULE_FAILED', slots
    else
      context.dispatch 'RECEIVE_SCHEDULE', slots

module.exports = (context, payload, done) ->
  debug 'showSchedule action'
  scheduleStore = context.getStore ScheduleStore
  if scheduleStore.isEmpty()
    fetchSchedule(context, payload, done)
  done()
