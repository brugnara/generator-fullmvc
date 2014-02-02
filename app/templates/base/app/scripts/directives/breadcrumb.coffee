define ['app'], (app) ->
  'use strict'

  app.directive 'breadcrumb', ->
    templateUrl: 'views/directives/breadcrumb.html'
    restrict: 'E'