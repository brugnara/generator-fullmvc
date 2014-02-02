define ['app', 'bootstrap'], (app, bs) ->
  'use strict'

  app.controller 'MenuCtrl', ($scope, $timeout) ->
    $scope.menuItems = [
      name: 'menuNetwork'
      path: '#/network'
      styleClass: ''
      id: 'divNetwork'
      img: 'images/menu/network.png'
      imgClick: 'images/menu/network_click.png'
    ,
      name: 'menuUI'
      path: '#/home'
      styleClass: ''
      id: 'divUI'
      img: 'images/menu/ui.png'
      imgClick: 'images/menu/ui_click.png'
    ,
      name: 'menuSecurity'
      path: '#/'
      styleClass: ''
      id: 'divSecurity'
      img: 'images/menu/security.png'
      imgClick: 'images/menu/security_click.png'
    ,
      name: 'menuPrinter'
      path: '#/'
      styleClass: ''
      id: 'divPrinter'
      img: 'images/menu/printer.png'
      imgClick: 'images/menu/printer_click.png'
    ,
      name: 'menuControlPanel'
      path: '#/controlpanel'
      styleClass: ''
      id: 'divControlPanel'
      img: 'images/menu/settings.png'
      imgClick: 'images/menu/settings_click.png'
    ]

    $scope.layoutDone = -> 
        $timeout (->
            setupMenu();
        ) , 0

  app.directive "repeatDone", ->
        (scope, element, attrs) ->
            scope.$eval attrs.repeatDone  if scope.$last

setupMenu = ->
  $.each $("div#menuList a"), ->
    $(this).children("span").children("span#menuTargetImg").addClass "menuHover" + $(this).index()

  $("div#menuList a").click ->
    id = $(this).attr("id")
    unless id is "configuratorMenuItem"
      $("a.active").removeClass "menuHover"
      $("a.active").removeClass "menuHover" + $("a.active").index()
      $("a.active").removeClass "active"
      $(this).addClass "active"
      $(this).addClass "menuHover"
      $(this).addClass "menuHover" + $(this).index()
      clicked = $(this)  unless id is "divHome"
      $("a#configuratorMenuItem").fadeOut 500  unless $("a#configuratorMenuItem").css("display") is "none"

  $("div#menuList a").hover (->
    if $(this).index() > 1
      $(this).addClass "menuHover"
      $(this).addClass "menuHover" + $(this).index()
  ), ->
    if $(this).index() > 1 and not $(this).hasClass("active")
      $(this).removeClass "menuHover"
      $(this).removeClass "menuHover" + $(this).index()            