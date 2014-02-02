define ['app'], (app) ->
  'use strict'

  app.directive 'btnSaveCancel', ->
    templateUrl: 'views/directives/btnsavecancel.html'
    restrict: 'E'