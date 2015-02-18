'use strict'

createStore = require('fluxible/utils/createStore')
routesConfig = require('../configs/routes')

ApplicationStore = createStore(
  storeName: 'ApplicationStore'
  handlers: 'CHANGE_ROUTE_SUCCESS': 'handleNavigate'

  initialize: ->
    @currentPageName = null
    @currentPage = null
    @currentRoute = null
    @pages = routesConfig
    @pageTitle = ''
    return

  handleNavigate: (route) ->
    if @currentRoute and @currentRoute.url == route.url
      return
    pageName = route.config.page
    page = @pages[pageName]
    @currentPageName = pageName
    @currentPage = page
    @currentRoute = route
    @emitChange()
    return

  getCurrentPageName: ->
    @currentPageName

  getPageTitle: ->
    @pageTitle

  getCurrentRoute: ->
    @currentRoute

  getPages: ->
    @pages

  dehydrate: ->
    {
      currentPageName: @currentPageName
      currentPage: @currentPage
      pages: @pages
      route: @currentRoute
      pageTitle: @pageTitle
    }

  rehydrate: (state) ->
    @currentPageName = state.currentPageName
    @currentPage = state.currentPage
    @pages = state.pages
    @currentRoute = state.route
    @pageTitle = state.pageTitle
    return
)

module.exports = ApplicationStore
