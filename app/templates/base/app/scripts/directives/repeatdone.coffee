define ['app'], (app) ->
  'use strict'

  app.directive 'repeatDone', ->
    (scope, element, attrs) ->
      scope.$eval attrs.repeatDone if (scope.$last)