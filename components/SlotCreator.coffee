'use strict'
debug = require('debug')('slotCreatorView')
React = require 'react'
createTimeslot = require '../actions/createTimeslot'
CategoryStore = require '../stores/CategoryStore'
ScheduleStore = require '../stores/ScheduleStore'
FluxibleMixin = require('fluxible').Mixin

{label, div, textarea, select, option, button} = React.DOM

PostComposer = React.createClass

  mixins: [FluxibleMixin]

  statics:
    storeListeners: [CategoryStore]

  getInitialState: ->
    @getState()

  getState: ->
    categoryStore = @getStore CategoryStore
    scheduleStore = @getStore ScheduleStore
    {
      categoryID: categoryStore.getCurrentID()
      categories: categoryStore.getAll()
      days: scheduleStore.getDaysOfWeek()
      day: '0'
      hour: '12'
      min: '0'
    }

  onChange: ->
    @setState @getState()

  render: ->
    div
      className: "ui form"
      div
        className: "inline fields"
        @_renderDay()
        @_renderTime("Hour", [0..23], @_onHourChange)
        @_renderTime("Min", [0, 15, 30, 45], @_onMinChange)
        div
          className: "field"
          label null, "Category"
          select
            name: "category"
            onChange: @_onCategoryChange
            for category in @state.categories
              option
                value: category.id
                key: category.id
                label: category.name
                category.name
        div
          className: "field"
          button
            className: "ui primary button"
            type: "button"
            onClick: @_onButtonClick
            "Add"

  _renderDay: ->
    div
      className: "field"
      label null, "Day"
      select
        name: "day"
        onChange: @_onDayChange
        for day in [0..6]
          option
            value: day
            key: day
            label: @state.days[day]
            @state.days[day]

  _renderTime: (name, range, handler) ->
    div
      className: "field"
      label null, name
      select
        name: "#{name}"
        onChange: handler
        for t in range
          option
            value: t
            key: t
            label: @_formatTime t
            @_formatTime t

  _formatTime: (intTime) ->
    t = "00#{intTime}"
    t[-2..]

  _onCategoryChange: (event, value) ->
    @state.categoryID = event.target.value

  _onDayChange: (event, value) ->
    @state.day = event.target.value

  _onHourChange: (event, value) ->
    @state.hour = event.target.value

  _onMinChange: (event, value) ->
    @state.min = event.target.value

  _onButtonClick: (event) ->
    @executeAction createTimeslot,
      categoryID: @state.categoryID
      dayOfWeek: @state.day
      hour: @state.hour
      min: @state.min

module.exports = PostComposer
