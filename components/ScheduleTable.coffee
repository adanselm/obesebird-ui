'use strict'
debug = require('debug')('scheduleView')
React = require 'react'
ScheduleStore = require '../stores/ScheduleStore'
CategoryStore = require '../stores/CategoryStore'
FluxibleMixin = require('fluxible').Mixin

{table, tbody, tr, td, th, div} = React.DOM

module.exports = React.createClass
  mixins: [FluxibleMixin]

  statics:
    storeListeners: [ScheduleStore, CategoryStore]

  getInitialState: ->
    @getState()

  getState: ->
    categoryStore = @getStore CategoryStore
    scheduleStore = @getStore ScheduleStore
    {
      byTime: scheduleStore.getAllByTime()
      days: scheduleStore.getDaysOfWeek()
      categories: categoryStore.getById()
    }

  onChange: ->
    @setState @getState()

  renderTds: (time, slots) ->
    l = [0..6].map (x) -> {day: x, cat: undefined}
    slots.map (x) -> l[x.dayOfWeek].cat = x.categoryID
    for i in l
      td
        key: "#{time}#{i.day}"
        if i.cat? and @state.categories[i.cat]?
          div
            className: "timeslot"
            @state.categories[i.cat].name

  formatTime: (time) ->
    h = "00#{time // 60}"
    m = "00#{time % 60}"
    "#{h[-2..]}:#{m[-2..]}"

  render: ->
    debug 'rendering schedule table'
    div null,
      table null,
        tbody null,
          tr null,
            th key: "time-th", ""
            for day in @state.days
              th key: day, day
          for time in Object.keys(@state.byTime)
            tr
              key: time
              td
                key: "time-#{time}"
                @formatTime time
              @renderTds time, @state.byTime[time]

