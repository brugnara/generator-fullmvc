define [
  'angular'
  'angularAMD'
  'ngUiBootstrap'
], (angular, angularAMD) ->
  'use strict'

  app = angular.module 'testsApp', [
    'ngRoute'
    'localization'
    'restangular'
    'ui.bootstrap'
  ]

  #angularAMD.bootstrap app
  app
