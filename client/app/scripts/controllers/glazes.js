'use strict';

/**
 * @ngdoc function
 * @name clientApp.controller:GlazesCtrl
 * @description
 * # GlazesCtrl
 * Controller of the clientApp
 */
angular.module('clientApp')
  .controller('GlazesCtrl', function ($scope, glazes, $stateParams, $log) {

    $scope.glazes = glazes;
  });
