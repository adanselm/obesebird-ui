'use strict'
debug = require('debug')('slotCreatorView')
React = require 'react'
createTimeslot = require '../actions/createTimeslot'
CategoryStore = require '../stores/CategoryStore'
ScheduleStore = require '../stores/ScheduleStore'
FluxibleMixin = require('fluxible').Mixin

{h1, div, textarea, select, option, button} = React.DOM

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
    div null,
      @_renderDay()
      @_renderTime("hour", [0..23], @_onHourChange)
      @_renderTime("min", [0, 15, 30, 45], @_onMinChange)
      select
        className: "category-selector"
        name: "category"
        onChange: @_onCategoryChange
        for category in @state.categories
          option
            value: category.id
            key: category.id
            label: category.name
            category.name
      button
        className: "add-button"
        type: "button"
        onClick: @_onButtonClick
        "Add"

  _renderDay: ->
    select
      className: "day-selector"
      name: "day"
      onChange: @_onDayChange
      for day in [0..6]
        option
          value: day
          key: day
          label: @state.days[day]
          @state.days[day]

  _renderTime: (name, range, handler) ->
    select
      className: "#{name}-selector"
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
