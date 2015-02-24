'use strict'
debug = require('debug')('scheduleView')
React = require 'react'
ScheduleTable = require './ScheduleTable'
SlotCreator = require './SlotCreator'

{h1, h2, div} = React.DOM

module.exports = React.createClass

  render: ->
    debug 'rendering Schedule'
    div null,
      h1 null, "Schedule"
      React.createElement ScheduleTable
      h2 null, "Add Slot:"
      React.createElement SlotCreator

