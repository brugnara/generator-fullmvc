console.log 'Initializing application (coffee)'

require.config
  paths:
    modules: '/modules'
    ctrl: '/scripts/controllers'
    directive: '/scripts/directives'

    angular: '/bower_components/angular/angular'
    angularRoute: '/bower_components/angular-route/angular-route'
    angularAMD: '/bower_components/angularAMD/angularAMD.min'
    jquery: '/bower_components/jquery/jquery.min'
    twitterBootstrap: '/bower_components/bootstrap-sass/dist/js/bootstrap.min'
    i18n: '/bower_components/angularjs-localizationservice/src/localize'
    restangular: '/bower_components/restangular/dist/restangular.min'
    _: '/bower_components/lodash/dist/lodash.min'
    ngUiBootstrap: '/bower_components/angular-bootstrap/ui-bootstrap-tpls.min'
  shim:
    angular :
      exports : 'angular'
    angularRoute: ['angular']
    angularAMD: ['angular']
    i18n: ['angular']
    bootstrap: ['i18n']
    twitterBootstrap : ['jquery']
    restangular: ['_', 'angular']
    ngUiBootstrap: ['angular', 'twitterBootstrap']
  baseUrl: 'scripts',
  priority: [
    "angular"
  ]

# Decommentando questo, il bootstrap blocca l'esecuzione fino al resumeBootstrap!
# window.name = "NG_DEFER_BOOTSTRAP!";

require [
  'angular'
  'angularRoute'
  'jquery'
  'twitterBootstrap'
  'app'
  'i18n'
  'bootstrap' # application bootstrapper
  'restangular'
  '_'
  'angularAMD'
], (angular, angularRoute, $, bs, app, appBs, i18n, restangular, _, aAMD) ->
  $html = angular.element(document.getElementsByTagName('html')[0]);

  # bootstrapping all dependencies
  ###
  $.get "modules/modules.json", (deps) ->
    # converts all array items from DEP to module!DEP
    deps = _.map deps, (dep) ->
      "module!#{dep}"

    console.log deps
    require deps, ->
      console.log "Dependencies loaded!"
  ###

  angular.element(document).ready () ->
    console.log "document is ready"
    # angular.bootstrap document, [app['name']]
    # angular.resumeBootstrap([app['name']]);
    # query function for menu toggle
    $("[data-toggle=offcanvas]").click ->
      $(".row-offcanvas").toggleClass "active"

    
