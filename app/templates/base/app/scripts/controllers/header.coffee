define ['app', 'bootstrap'], (app, bs) ->
  'use strict'

  app.controller 'HeaderCtrl', ($scope, $rootScope) ->
    $scope.searchText = "";
    
    $scope.updateSearch = -> 
      $rootScope.searchText = $scope.searchText;
        
