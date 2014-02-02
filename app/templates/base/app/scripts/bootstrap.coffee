define [
  'app'
  'jquery'
  '_'
  'angularAMD'
  'i18n'
  # controllers
  'ctrl/header'
  'ctrl/menu'
  # directives
  'directive/breadcrumb'
  'directive/btnsavecancel'
  'directive/repeatdone'
]
, (app, $, _, angularAMD, i18n) ->

  modulesJson = null
  modules = null
  # load dependancies and subdependencies for infinite level.
  getDependencies = (deps, dep, item) ->
    deps.push dep if dep
    console.log "DEP: #{dep}"
    console.log "Item: #{JSON.stringify item}"
    getDependencies deps, d, i for d, i of item.dependencies if item?.dependencies?

  # bootstrapping all dependencies
  $.get "modules/modules.json", (json) ->
    modulesJson = json
    deps = []
    getDependencies deps, null, json
    console.log deps
    modules = $.extend(true, {}, deps)
    # converts all array items from DEP to module!DEP
    deps = _.map deps, (dep) ->
      "module!#{dep}"

    console.log JSON.stringify deps

    # require modules and bootstrap
    require deps, ->
      console.log "Dependencies loaded!"
      angularAMD.bootstrap app

  app.config ($routeProvider) ->
    #
    console.log JSON.stringify app
    console.log 'Bootstrapping application (coffee)'
    #
    $routeProvider
      .when '/',
        redirectTo: '/home'
      .otherwise
        redirectTo: '/'

  app.run ($cacheFactory, i18nFilter) ->
    # require i18n language files
    i18nFilter 'title', module for module in modules
    #
    console.log 'Saving modules.json in cache. Reachable with $cacheFactory.get("system").get("modulesJson") from each module in application'
    cache = $cacheFactory.get('system') || $cacheFactory 'system'
    cache.put 'modulesJson', modulesJson






